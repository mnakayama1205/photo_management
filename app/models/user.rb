class User < ApplicationRecord
  has_many :photos

  validates :account_id, presence: true
  validates :password, presence: true
end
