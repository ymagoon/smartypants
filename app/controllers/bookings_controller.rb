class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :approve, :deny]
<<<<<<< HEAD
=======
  before_action :set_bundle, only: [:create]
>>>>>>> ee5483b8177631f82342b1cc44a4642bb19fb6b5
  after_action :verify_authorized, except: [:index, :show], unless: :skip_pundit?

  def index
    @bookings = policy_scope(Booking)
    @pending_bookings = @bookings.select { |booking| booking.pending_booking? }
    @active_bookings = @bookings.select { |booking| booking.current_booking? || booking.future_booking? }.sort_by { |booking| booking.start_date }
    @past_bookings = @bookings.select { |booking| booking.past_booking? }
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
    authorize @bundle
  end

  def set_booking
    @booking = Booking.find(params[:id])
<<<<<<< HEAD
    authorize @booking
=======

>>>>>>> ee5483b8177631f82342b1cc44a4642bb19fb6b5
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

