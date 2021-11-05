class CreateLabTests < ActiveRecord::Migration[6.0]
  def change
    create_table :lab_tests do |t|
      t.references :sample, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true
      t.boolean :sm_nd, default: false
      t.boolean :sr_sr, default: false
      t.boolean :c_o, default: false
      t.boolean :u_pb_det, default: false
      t.boolean :u_pb_ign, default: false
      t.boolean :u_pb_carb, default: false
      t.boolean :imag, default: false
      t.boolean :mev, default: false
      t.boolean :selfrag, default: false
      t.boolean :sample_pulv, default: false

      t.timestamps
    end
  end
end
