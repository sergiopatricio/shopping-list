class Group < ApplicationRecord
  has_many :items, -> { order(:type, :position) }, class_name: 'Item::Base', inverse_of: :group, dependent: :destroy
  has_many :regular_items, -> { order(:position) }, class_name: 'Item::Regular', inverse_of: :group, dependent: :destroy
  has_many :temporary_items, -> { order(:position) },
           class_name: 'Item::Temporary', inverse_of: :group, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
end
