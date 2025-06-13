# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :rememberable, :trackable

  belongs_to :account
  has_one :user_configuration, dependent: :destroy

  def configuration
    user_configuration || create_user_configuration!
  end
end
