class Bundle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :items
  mount_uploader :photo, PhotoUploader

  @age_groups = ['Newborn',
                 '0 to 3 months',
                 '3 to 6 months',
                 '6 to 9 months',
                 '9 to 12 months',
                 '12 to 18 months',
                 '18 to 24 months',
                 '2T',
                 '3T']

  validates :name, presence: true, length: { minimum: 5 }
  validates :gender, presence: true, inclusion: { in: ['Male', 'Female'] }
  validates :age_group, presence: true, inclusion: { in: @age_groups }
  validates :price_per_day, presence: true, numericality: true

  # def price_per_day
  #   self.price_per_day
  # end

  def self.gender
    ['Male', 'Female']
  end

  def self.age_groups
    ['Newborn','0 to 3 months','3 to 6 months','6 to 9 months','9 to 12 months','12 to 18 months','18 to 24 months','2T','3T']
  end

  def price_per_day_formatted
    format(self.price_per_day)
  end

  private

  def format(price)
    sprintf("%.2f", price)
  end
end
