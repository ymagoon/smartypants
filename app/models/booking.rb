class Booking < ApplicationRecord
  belongs_to :bundle
  belongs_to :user

  after_create :set_price

  @status = ['Pending', 'Approved', 'Denied']

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: @status }
  validates :shipping_address, presence: true

  validate :date_picker_validation
  # validate :check_availability

  def price_formatted
    format(self.price)
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
