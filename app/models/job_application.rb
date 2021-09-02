class JobApplication < ApplicationRecord
  belongs_to :job
  mount_uploader :resume, ResumeUploader

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: " is not correct. Please enter an e-mail adress" } 
  validates :phone, presence: true, numericality: true, length: { minimum: 9, maximum: 15 } 
  validates :address, presence: true
  validates :professional_qualifications, presence: true
  validates :resume, presence: true
end
