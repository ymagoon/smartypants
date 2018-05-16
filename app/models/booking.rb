class Booking < ApplicationRecord
  belongs_to :bundle
  belongs_to :user


  validates :start_date, :presence: true, :date_validation
  validates :end_date, :presence: true, :date_validation
  validates :status, :presence: true
  validates :price, :presence: true, numerality: true
  validates :age_group, :presence: true
  validates :shipping_address, :presence: true

  def date_validation
    if self[:end_date] < self[:start_date]
      # errors[:end_date] << "Error message"
      return false
    elsif self[:start_date] < Date.now
      return false
    else
      return true
    end
  end
end
