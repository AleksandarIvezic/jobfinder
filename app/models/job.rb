class Job < ApplicationRecord
  has_many :job_applications, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :creator_id, presence: true
  validates :category, presence: true
  validates :expiring_date, presence: true
end
