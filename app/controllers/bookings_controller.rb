class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :approve, :deny]
  before_action :set_bundle, only: [:new, :create] #, :approve, :deny

  def index
    @bookings = Booking.where(user: current_user)
    @pending_bookings = @bookings.select { |booking| booking.status == 'Pending' }
    @active_bookings = @bookings.select { |booking| booking.status == 'Approved' && booking.start_date > DateTime.now }
    @past_bookings = @bookings.select { |booking| booking.status == 'Approved' && booking.end_date < DateTime.now }
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bundle = @bundle
    @booking.user = current_user

    @booking.price = @booking.set_price(@bundle.price_per_day, params[:start_date], params[:end_date])

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'bundles/show'
    end
  end

  def approve
    @booking.update(status: 'Approved')
    redirect_to bookings_path
  end

  def deny
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
  end
end

