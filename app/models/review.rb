class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bundle
  belongs_to :booking
  validates :user, presence: true, null: false
  validates :bundle, presence: true, null: false
end
