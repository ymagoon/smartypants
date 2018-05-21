class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :approve, :deny]
  before_action :set_bundle, only: [:new, :create] #, :approve, :deny
  after_action :verify_authorized, except: [:index, :show], unless: :skip_pundit?


  def index
    @bookings = policy_scope(Booking)
    @bookings = Booking.all.select { |booking| booking.bundle.user == current_user } #where(user: current_user)
    @pending_bookings = @bookings.select { |booking| booking.status == 'Pending' }
    @active_bookings = @bookings.select { |booking| booking.status == 'Approved' && booking.start_date > DateTime.now }
    @past_bookings = @bookings.select { |booking| booking.status == 'Approved' && booking.end_date < DateTime.now }

  end

  def show
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bundle = @bundle
    @booking.user = current_user

    @booking.status = 'Pending'
    authorize @booking

    if @booking.save
      redirect_to booking_path(@booking)
    else
      raise
      render 'bundles/show'
    end
  end

  def approve
    authorize @booking
    @booking.update(status: 'Approved')
    redirect_to bookings_path
  end

  def deny
    authorize @booking
    @booking.update(status: 'Denied')
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:bundle_id, :start_date, :end_date, :status,
                                             :shipping_address, :comment)
  end

  def set_bundle
    @bundle = Bundle.find(params[:bundle_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

