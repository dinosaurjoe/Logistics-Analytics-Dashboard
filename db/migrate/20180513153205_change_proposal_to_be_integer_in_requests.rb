class ChangeProposalToBeIntegerInRequests < ActiveRecord::Migration[5.1]
  def change
      change_column :requests, :proposal, :integer
  end
end
