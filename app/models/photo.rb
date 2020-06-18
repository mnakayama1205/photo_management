class Photo < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true
  validates :photo, presence: true
end
