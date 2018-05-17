class Item < ApplicationRecord
  belongs_to :bundle

  def self.categories
    %w(Onsie Dress Footwear Socks Shorts Pants Top Bib Playsuit).sort
  end

  def self.colors
    %w(Red Orange Yellow Green Blue Indigo Violet).sort
  end

  def self.conditions
    ['Brand New', 'Mint', 'Used', 'Worn']
  end

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: self.categories }
  validates :color, presence: true, inclusion: { in: self.colors }
  validates :condition, presence: true, inclusion: { in: self.conditions }
end
