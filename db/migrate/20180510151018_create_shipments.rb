class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.references :shop, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
