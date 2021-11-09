class CreateSampleAnalyses < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_analyses do |t|
      t.references :sample, null: false, foreign_key: true
      t.references :lab_analysis, null: false, foreign_key: true

      t.timestamps
    end
  end
end
