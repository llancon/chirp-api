class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token
  has_many :posts
  acts_as_follower
  acts_as_followable

  validates :email, presence: true, uniqueness: true
end
