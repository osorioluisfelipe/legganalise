class LabAnalysis < ApplicationRecord
  has_many :sample_analyses, dependent: :destroy
end
