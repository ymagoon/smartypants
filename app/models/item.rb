class Item < ApplicationRecord
  belongs_to :bundle

  @categories = %w(Onsie Dress Footwear Socks Shorts Pants Top Bib Playsuit).sort
  @colors = %w(Red Orange Yellow Green Blue Indego Violet).sort
  @conditions = ['Brand New', 'Mint', 'Used', 'Worn']

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: @categories }
  validates :color, presence: true, inclusion: { in: @colors }
  validates :condition, presence: true, inclusion: { in: @conditions }
end
