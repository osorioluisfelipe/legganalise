class LabAnalysis < ApplicationRecord
  belongs_to :request
  belongs_to :sample
end
