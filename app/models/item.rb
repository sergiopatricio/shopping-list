# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :account
  belongs_to :group

  validates :name, presence: true, uniqueness: { scope: :group_id }
  validates :position, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validate :validate_same_account_on_item_and_group
  validates :url, url: true, allow_blank: true

  scope :to_buy, -> { where('total > 0') }
  scope :temporary, -> { where(temporary: true) }
  scope :confirmed, -> { where(confirmed: true) }

  private

  def validate_same_account_on_item_and_group
    return if group.blank? || account.blank?
    return if group.account_id == account_id

    # same error from association
    errors.add(:group, :blank, message: :required)
  end
end
