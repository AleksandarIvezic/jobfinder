class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, foreign_key: :creator_id

  validates :name, presence: true, length: { maximum: 20}
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: " is not correct. Please enter an e-mail adress" }
  validates :password, presence: true, confirmation: true, length: {within: 6..40}
  
end
