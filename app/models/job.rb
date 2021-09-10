class Job < ApplicationRecord
  has_many :job_applications, dependent: :destroy
  has_rich_text :description

  validates :name, presence: true
  validates :description, presence: true
  validates :creator_id, presence: true
  validates :category, presence: true
  validates :expiring_date, presence: true
end
