class Bundle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :items
  has_many :reviews
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

<<<<<<< HEAD
  def number_of_reviews
    @bundle.reviews.length
  end

  def average_review
    sum = 0
    @bundle.reviews.stars.each { |stars| sum += stars }
    return (sum * 2).round / 2.0
  end

  @star_review = {
    0.5: <i class="fas fa-star-half"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>,
    1.0: <i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>,
    1.5: <i class="fas fa-star"></i><i class="fas fa-star-half"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>,
    2.0: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>,
    2.5: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i><i class="far fa-star"></i><i class="far fa-star"></i>,
  }

=======
  def number_of_items
    self.items.size
  end

>>>>>>> ee5483b8177631f82342b1cc44a4642bb19fb6b5
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
