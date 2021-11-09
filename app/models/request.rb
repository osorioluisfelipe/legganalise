class Request < ApplicationRecord
  belongs_to :user
  has_many :samples
  has_many :lab_analysis, through: :samples
  validates :project_name, :project_summary, presence: true
end
