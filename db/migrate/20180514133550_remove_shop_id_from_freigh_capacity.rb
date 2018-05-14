class RemoveShopIdFromFreighCapacity < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :freight_capacities, :shop_id
    remove_column :freight_capacities, :shop_id, :integer
  end
end
