class AddVolumeToFreightCapacity < ActiveRecord::Migration[5.1]
  def change
    add_column :freight_capacities, :volume, :integer
  end
end
