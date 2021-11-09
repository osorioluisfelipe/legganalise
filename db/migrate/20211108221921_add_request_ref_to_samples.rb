class AddRequestRefToSamples < ActiveRecord::Migration[6.0]
  def change
    add_reference :samples, :request, foreign_key: true
  end
end
