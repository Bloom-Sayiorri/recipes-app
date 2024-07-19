class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, lenght: {min: 6}
end
