class AddDescriptionToBundles < ActiveRecord::Migration[5.2]
  def change
    add_column :bundles, :description, :text
  end
end
