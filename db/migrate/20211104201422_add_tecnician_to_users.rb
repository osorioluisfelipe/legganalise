class AddTecnicianToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tecnician, :boolean, default: false
  end
end
