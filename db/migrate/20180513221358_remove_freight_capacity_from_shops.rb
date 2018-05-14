class RemoveFreightCapacityFromShops < ActiveRecord::Migration[5.1]
  def change
    remove_column :shipments, :freight_capacity, :integer
    remove_column :shops, :freight_capacity, :integer
  end
end
