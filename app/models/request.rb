class Request < ApplicationRecord
  belongs_to :user
  has_many :samples
  has_many :lab_analysis, through: :samples
  validates :project_name, :project_summary, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_project_name_and_project_summary,
    against: [ :project_name, :project_summary],
    using: {
      tsearch: { prefix: true }
    }
  def my_unique_id
    "BOL %.3d/2021" % id
  end
end
