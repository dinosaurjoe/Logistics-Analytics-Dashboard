class AddRequestCountToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :requests_count, :integer, default: 0
  end
end
