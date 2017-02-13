class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :rental, foreign_key: true
      t.text :content
      t.integer :rate
      t.boolean :is_owner

      t.timestamps
    end
  end
end
