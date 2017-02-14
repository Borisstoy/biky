class AddDefaultValueToRental < ActiveRecord::Migration[5.0]
  def change
    change_column :rentals, :status, :string, :default => "P"
  end
end
