class User < ApplicationRecord
  validates :account_id, presence: true
  validates :password, presence: true
end
