class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20}
end
