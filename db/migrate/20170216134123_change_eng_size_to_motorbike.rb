class ChangeEngSizeToMotorbike < ActiveRecord::Migration[5.0]
  def change
    remove_column :motorbikes, :engine_size, :string
    add_column :motorbikes, :engine_size, :integer
  end
end
