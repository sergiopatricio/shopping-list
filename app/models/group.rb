class Group < ApplicationRecord
  has_many :items, -> { order(:position) }, inverse_of: :group, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
end
