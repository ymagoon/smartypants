class Bundle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :items
  has_many :reviews, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  def self.gender
    ['Male', 'Female']
  end

  def self.age_groups
    ['Newborn','0 to 3 months','3 to 6 months','6 to 9 months','9 to 12 months','12 to 18 months','18 to 24 months','2T','3T']
  end

  def price_per_day_formatted
    format(self.price_per_day)
  end

  def number_of_reviews
    self.reviews.length
  end

  def average_rating
    sum = 0
    if number_of_reviews > 0
      self.reviews.each { |review| sum += review.stars }
      sum.round / number_of_reviews
    else
      0
    end
  end

  def blank_stars
    5 - average_rating
  end

  def number_of_items
    self.items.size
  end

  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :gender, presence: true, inclusion: { in: Bundle.gender }
  validates :age_group, presence: true, inclusion: { in: Bundle.age_groups }
  validates :price_per_day, presence: true, numericality: true

  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  private

  def format(price)
    puts price
    sprintf("%.2f", price)
  end
end
