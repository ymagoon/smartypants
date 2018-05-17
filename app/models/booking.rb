class Booking < ApplicationRecord
  belongs_to :bundle
  belongs_to :user

  @status = ['Pending', 'Approved', 'Denied']

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: @status }
  validates :price, presence: true, numericality: true
  validates :shipping_address, presence: true

  validate :date_validation

  def set_price(price_per_day, start_date, end_date)
    @price = (end_date - start_date) * price_per_day
  end

  private
  def date_validation
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
end
