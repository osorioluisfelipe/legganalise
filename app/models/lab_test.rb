class LabTest < ApplicationRecord
  belongs_to :sample
  belongs_to :request
  # acrescentar mensagem de erro
  validates :test?, inclusion: [true]

  def test?
    :sm_nd || :sr_sr || :c_o || :u_pb_det || :u_pb_ign || :u_pb_carb || :imag || :mev || :selfrag || :sample_pulv
  end
end
