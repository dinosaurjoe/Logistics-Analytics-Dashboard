class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.references :locatable, polymorphic: true
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end