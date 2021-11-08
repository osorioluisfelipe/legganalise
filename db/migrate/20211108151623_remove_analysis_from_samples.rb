class RemoveAnalysisFromSamples < ActiveRecord::Migration[6.0]
  def change
    remove_column :samples, :analysis
  end
end
