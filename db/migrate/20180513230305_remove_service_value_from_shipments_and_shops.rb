class RemoveServiceValueFromShipmentsAndShops < ActiveRecord::Migration[5.1]
  def change
    remove_column :shipments, :service_value, :integer
    remove_column :shops, :service_value, :integer
  end
end
