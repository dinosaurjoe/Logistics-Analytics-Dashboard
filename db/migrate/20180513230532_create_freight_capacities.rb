class CreateFreightCapacities < ActiveRecord::Migration[5.1]
  def change
    create_table :freight_capacities do |t|
      t.references :shop, foreign_key: true
      t.references :shipment, foreign_key: true
      t.string :transportation_type
      t.string :container_size
      t.integer :service_value

      t.timestamps
    end
  end
end
