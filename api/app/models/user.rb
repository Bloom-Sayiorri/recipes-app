class User < ApplicationRecord
  has_secure_password

  has_one :profile
  has_many :recipes
  has_many :comments

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
