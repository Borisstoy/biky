class CreateMotorbikes < ActiveRecord::Migration[5.0]
  def change
    create_table :motorbikes do |t|
      t.integer :day_price
      t.string :brand
      t.string :model
      t.text :description
      t.string :engine_size
      t.integer :kilometers
      t.string :circulation_date
      t.string :location
      t.integer :motorbike_rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
