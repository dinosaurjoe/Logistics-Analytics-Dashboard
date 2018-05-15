class AddShippableToFreightCapacities < ActiveRecord::Migration[5.1]
  def change
    add_reference :freight_capacities, :shippable, polymorphic: true
    remove_foreign_key :freight_capacities, :shipment_id
    remove_column :freight_capacities, :shipment_id, :integer
  end
end
