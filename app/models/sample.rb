class Sample < ApplicationRecord
  belongs_to :request
  has_many :sample_analyses, dependent: :destroy
  has_many :lab_analyses, through: :sample_analyses

  validates :sample_name, :sample_type, :sample_matrix, presence: true
end
