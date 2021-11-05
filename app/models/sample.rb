class Sample < ApplicationRecord
  belongs_to :user
  has_many :lab_tests
  has_many :request, through: :lab_tests
end
