class DropLabTests < ActiveRecord::Migration[6.0]
  def change
    drop_table :lab_tests
  end
end
