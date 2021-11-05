class Request < ApplicationRecord
  belongs_to :user
  has_many :lab_tests
  has_many :samples, through: :lab_tests
end
