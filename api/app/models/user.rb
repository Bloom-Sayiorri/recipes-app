class User < ApplicationRecord
  has_secure_password
  has_one :profile
  has_many :recipes
  has_many :comments

  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20}
end
