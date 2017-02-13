class RemoveRatingToMotorbikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :motorbikes, :motorbike_rating, :integer
  end
end
