class Item < ApplicationRecord
  belongs_to :group

  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
end
