class Booking < ApplicationRecord
  belongs_to :bundle
  belongs_to :user
  after_create :set_price

  @status = ['Pending', 'Approved', 'Denied']

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: @status }
  validates :shipping_address, presence: true

  validate :date_validation

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

  def set_price
    @bundle = self.bundle
    self.price = ((self.end_date - self.start_date).to_f).round * @bundle.price_per_day
    self.save
  end
end
