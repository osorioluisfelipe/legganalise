class Sample < ApplicationRecord
  belongs_to :user
  has_many :lab_analysis
  has_many :requests, through: :lab_analysis

  validates :sample_name, :sample_type, :sample_matrix, presence: true
end
