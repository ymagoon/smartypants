class Bundle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :items

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
end
