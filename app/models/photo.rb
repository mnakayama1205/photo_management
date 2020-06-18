class Photo < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true, length: { maximum: 30 }
  validates :photo, presence: true
end
