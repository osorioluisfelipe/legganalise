class Request < ApplicationRecord
  belongs_to :user
  has_many :samples
  has_many :lab_analysis, through: :samples
  validates :sample_quantity, :project_name, :project_summary, presence: true
end
