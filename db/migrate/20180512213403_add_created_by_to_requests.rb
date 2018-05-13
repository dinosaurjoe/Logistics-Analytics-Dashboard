class AddCreatedByToRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :requests, :created_by
  end
end
