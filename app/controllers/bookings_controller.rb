class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]
  before_action :set_bundle, only: [:create]

  def index
    @bookings = Booking.all.where(user: current_user)
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
      render 'bundles/show' # this needs to be the bundle show page
    end
  end

  # def edit

  # end

  def update
    @booking.update(status: <fix me>)
    redirect_to '/bookings' #fix me
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status,
                                    :shipping_address, :comment)
  end

  def set_bundle
    @bundle = Bundle.find(params[:bundle_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

