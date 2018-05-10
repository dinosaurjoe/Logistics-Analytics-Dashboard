class AddDestinationAndOriginToShipments < ActiveRecord::Migration[5.1]
  def change
    add_column :shipments, :destination, :string
    add_column :shipments, :origin, :string
  end
end
