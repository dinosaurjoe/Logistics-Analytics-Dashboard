class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true
      t.integer :freight_capacity
      t.integer :service_value
      t.string :name

      t.timestamps
    end
  end
end
