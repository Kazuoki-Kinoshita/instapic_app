class Picture < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 150 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
end