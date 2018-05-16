class CreateBundles < ActiveRecord::Migration[5.2]
  def change
    create_table :bundles do |t|
      t.string :name, null: false
      t.string :gender, null:false
      t.string :age_group, null:false
      t.float :price_per_day, null:false
      t.string :photo
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
