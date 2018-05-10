class AddFreightCapacityAndServiceValueToShipments < ActiveRecord::Migration[5.1]
  def change
    add_column :shipments, :freight_capacity, :integer
    add_column :shipments, :service_value, :integer
  end
end
