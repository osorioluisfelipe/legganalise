class LabAnalysis < ApplicationRecord
  has_many :sample_analyses
  validates :analysis_name, presence: true
end
