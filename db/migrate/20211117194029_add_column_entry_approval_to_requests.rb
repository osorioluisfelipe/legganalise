class AddColumnEntryApprovalToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :entry_approval, :boolean, default: false
  end
end
