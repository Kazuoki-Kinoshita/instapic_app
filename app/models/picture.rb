class Picture < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 150 }
end