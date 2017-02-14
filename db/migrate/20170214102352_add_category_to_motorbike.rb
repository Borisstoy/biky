class AddCategoryToMotorbike < ActiveRecord::Migration[5.0]
  def change
    add_column :motorbikes, :category, :string
  end
end
