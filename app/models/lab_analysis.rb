class LabAnalysis < ApplicationRecord
  has_many :sample_analyses, dependent: :destroy
  validates :analysis_name, presence: true
end
