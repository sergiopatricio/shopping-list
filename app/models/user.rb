class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :rememberable, :trackable

  has_many :groups, dependent: :destroy
  has_many :items, class_name: 'Item::Base', dependent: :destroy
  has_many :regular_items, class_name: 'Item::Regular', dependent: :destroy
  has_many :temporary_items, class_name: 'Item::Temporary', dependent: :destroy

  validates :email, email: true, uniqueness: true

  # enable devise "remember be" by default
  def remember_me
    true
  end
end
