class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :approve, :deny]
  before_action :set_bundle, only: [:new, :create]

  def index
    @bookings = Booking.all.select { |booking| booking.bundle.user == current_user }
    @pending_bookings = @bookings.select { |booking| booking.pending_booking? }
    @active_bookings = @bookings.select { |booking| booking.current_booking? || booking.future_booking? }.sort_by { |booking| booking.start_date }
    ap @active_bookings
    @past_bookings = @bookings.select { |booking| booking.past_booking? }
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bundle = @bundle
    @booking.user = current_user

    @booking.status = 'Pending'

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

