class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :rememberable

  validates :email, email: true, uniqueness: true
end
