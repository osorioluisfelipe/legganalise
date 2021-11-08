class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.string :sample_name
      t.string :sample_matrix
      t.string :sample_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
