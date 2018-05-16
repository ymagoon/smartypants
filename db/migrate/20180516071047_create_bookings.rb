class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date, null: false, index: true
      t.date :end_date, null: false, index: true
      t.string :status, null: false
      t.float :price, null: false
      t.string :age_group, null: false
      t.string :shipping_address, null: false
      t.text :comment
      t.references :bundle, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
