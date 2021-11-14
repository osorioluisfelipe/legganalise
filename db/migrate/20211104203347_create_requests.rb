class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :sample_quantity
      t.datetime :request_date
      t.datetime :approval_date
      t.datetime :results_date
      t.string :project_name
      t.text :project_summary
      t.boolean :request_approval, default: false
      t.boolean :results_ready, default: false
      t.boolean :results_approval, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
