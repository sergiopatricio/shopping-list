class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
end
