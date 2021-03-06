# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :items, -> { order(:position) }, inverse_of: :group, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :position, presence: true
end
