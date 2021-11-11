class Request < ApplicationRecord
  belongs_to :user
  has_many :samples, dependent: :destroy
  has_many :lab_analysis, through: :samples
  validates :project_name, :project_summary, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_project_name_and_project_summary,
    against: [ :project_name, :project_summary, :id],
    using: {
      tsearch: { prefix: true }
    }
  def my_unique_id
    "BOL %.0d/#{Date.today.year}" % id
  end
end
