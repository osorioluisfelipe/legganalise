class CreateLabAnalyses < ActiveRecord::Migration[6.0]
  def change
    create_table :lab_analyses do |t|
      t.string :analysis_name
      t.references :request, null: false, foreign_key: true
      t.references :sample, null: false, foreign_key: true

      t.timestamps
    end
  end
end
