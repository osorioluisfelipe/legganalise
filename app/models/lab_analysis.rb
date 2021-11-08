class LabAnalysis < ApplicationRecord
  belongs_to :request
  belongs_to :sample

  LABANALYSIS = [ "sm_nd", "sr_sr", "c_o", "u_pb_ign", "u_pb_det", "u_pb_carb", "imag", "mev", "selfrag", "pulv" ]

  validates :analysis_name, inclusion: { in: LABANALYSIS}
end
