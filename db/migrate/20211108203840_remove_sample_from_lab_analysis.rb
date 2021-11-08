class RemoveSampleFromLabAnalysis < ActiveRecord::Migration[6.0]
  def change
    remove_reference :lab_analyses, :sample, null: false, foreign_key: true
  end
end
