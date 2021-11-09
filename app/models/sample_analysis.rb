class SampleAnalysis < ApplicationRecord
  belongs_to :sample
  belongs_to :lab_analysis
end
