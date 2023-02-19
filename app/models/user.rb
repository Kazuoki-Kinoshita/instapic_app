class User < ApplicationRecord
  validates :full_name, presence: true, length: { maximum: 30}
  validates :user_name, presence: true, length: { maximum: 30}
  validates :email, presence: true, length: { maximum: 255 },
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
             uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6}
  has_many :pictures
end