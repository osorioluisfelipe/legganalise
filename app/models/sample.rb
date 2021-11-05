class Sample < ApplicationRecord
  belongs_to :user
  has_many :lab_tests
  has_many :requests, through: :lab_tests

  validates :sample_name, :sample_type, :sample_matrix, presence: true
end
