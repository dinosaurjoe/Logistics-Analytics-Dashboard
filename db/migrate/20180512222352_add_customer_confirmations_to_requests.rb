class AddCustomerConfirmationsToRequests < ActiveRecord::Migration[5.1]
  def change
      add_column :requests, :customer_confirmation, :boolean
  end
end
