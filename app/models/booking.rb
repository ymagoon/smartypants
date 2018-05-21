class Booking < ApplicationRecord
  belongs_to :bundle
  belongs_to :user

  before_create :set_price, :set_confirmation

  @status = ['Pending', 'Approved', 'Denied']

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: @status }
  # validates :shipping_address, presence: true

  validate :date_picker_validation, on: :create
  # validate :check_availability

  def price_formatted
    format(self.price)
  end

  def price_without_service_fee
    format(self.price - service_fee)
  end

  def days
    ((self.end_date - self.start_date).to_f).round
  end

  def service_fee
    find_service_fee
  end

  def service_fee_formatted
    format(find_service_fee)
  end

  def pending_booking?
    self.status == 'Pending'
  end

  def current_booking?
    self.approved_booking? && self.start_date <= DateTime.now && self.end_date >= DateTime.now
  end

  def future_booking?
    self.approved_booking? && self.start_date >= DateTime.now
  end

  def past_booking?
    self.approved_booking? && self.end_date <= DateTime.now
  end

  def approved_booking?
    self.status == 'Approved'
  end

  private

  # If the user selects something weird in the booking form
  def date_picker_validation
    if self.start_date > self.end_date
      errors[:start_date] << "must be before end date"
      return false
    elsif DateTime.now > self.start_date
      errors[:start_date] << "must be in the future"
      return false
    else
      return true
    end
  end

  def set_price
    @bundle = self.bundle
    self.price = self.days * @bundle.price_per_day
    self.price += set_service_fee(self.price)
    set_confirmation
    self.save
  end

  def set_service_fee(price)
    price * 0.15
  end

  def find_service_fee
    (self.price - (self.price / 1.15)).round(2)
  end

  def format(price)
    sprintf("%.2f", price)
  end

  def set_confirmation
    self.confirmation = %w(k d e 5 4 2 0 d 8 3 2 e m b 1).sample(10).join
  end
end


  # def check_availability
  #   bookings = self.bundle.bookings

  #   valid = bookings.all? do |booking|
  #     puts "#{self.start_date} #{self.end_date}"
  #     puts "#{booking.start_date} #{booking.end_date}"
  #     puts self.start_date <= booking.start_date
  #     puts booking.start_date <= self.end_date

  #     (self.start_date <= booking.start_date && booking.start_date <= self.end_date) &&
  #     (booking.start_date <= self.start_date && self.start_date <= booking.end_date) #&&
  #     # (self.start_date < booking.start_date && self.end_date < booking.end_date) &&
  #     # (booking.start_date < self.start_date && booking.end_date < self.end_date)
  #   end

  #   self.errors[:start_date] << 'not available for these dates' unless valid
  # end
