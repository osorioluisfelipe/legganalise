class AddAnalysisToSample < ActiveRecord::Migration[6.0]
  def change
    add_column :samples, :analysis, :string
  end
end
