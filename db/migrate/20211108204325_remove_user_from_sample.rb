class RemoveUserFromSample < ActiveRecord::Migration[6.0]
  def change
    remove_reference :samples, :user, null: false, foreign_key: true
  end
end
