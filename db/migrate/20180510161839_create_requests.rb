class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :proposal
      t.references :user
      t.references :customer
      t.boolean :user_confirmation

      t.timestamps
    end
  end
end
