# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :rememberable, :trackable

  has_many :groups, dependent: :destroy
  has_many :items, dependent: :destroy
  has_one :preference, dependent: :destroy

  validates :email, email: true, uniqueness: true

  # enable devise "remember be" by default
  def remember_me
    true
  end

  def preference_for(key)
    return unless Preference.active_preferences.include?(key)

    preference&.send(key)
  end

  def save_preference(key, value)
    return unless Preference.active_preferences.include?(key)

    (preference || build_preference).send("save_#{key}", value)
  end
end
