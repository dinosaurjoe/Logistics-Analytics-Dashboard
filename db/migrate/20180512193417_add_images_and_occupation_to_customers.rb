class AddImagesAndOccupationToCustomers < ActiveRecord::Migration[5.1]
  def change
      add_column :customers, :occupation, :string
      add_column :customers, :images, :string
  end
end
