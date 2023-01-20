# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :account
  has_many :items, -> { order(:position) }, inverse_of: :group, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :account_id }
  validates :position, presence: true
end
