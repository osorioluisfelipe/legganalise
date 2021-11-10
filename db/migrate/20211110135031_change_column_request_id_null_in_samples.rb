class ChangeColumnRequestIdNullInSamples < ActiveRecord::Migration[6.0]
  def change
    change_column_null :samples, :request_id, false
  end
end
