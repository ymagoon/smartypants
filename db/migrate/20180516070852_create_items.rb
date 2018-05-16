class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :color, null: false
      t.string :condition, null: false
      t.references :bundle, foreign_key: true

      t.timestamps
    end
  end
end
