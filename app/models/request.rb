class Request < ApplicationRecord
  belongs_to :user
  has_many :samples, dependent: :destroy
  has_many :lab_analysis, through: :samples
  validates :project_name, :project_summary, presence: true
  has_one_attached :result, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
    against: %i[ project_name project_summary id],
    associated_against: {
    samples: %i[ sample_name sample_type sample_matrix]
    },
    using: {
      tsearch: { prefix: true }
    }
  def my_unique_id
    "BOL %.0d/#{Date.today.year}" % id
  end
end
