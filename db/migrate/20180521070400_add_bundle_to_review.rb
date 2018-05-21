class AddBundleToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :bundle, foreign_key: true
  end
end
