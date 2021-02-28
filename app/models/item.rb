# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true, uniqueness: { scope: :group_id }
  validates :position, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validate :validate_same_user_on_item_and_group

  scope :to_buy, -> { where('total > 0') }
  scope :temporary, -> { where(temporary: true) }
  scope :regular, -> { where(temporary: false) }

  private

  def validate_same_user_on_item_and_group
    return if group.blank? || user.blank?
    return if group.user_id == user_id

    # same error from association
    errors.add(:group, :blank, message: :required)
  end
end
