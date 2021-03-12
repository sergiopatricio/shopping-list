# frozen_string_literal: true

class Preference < ApplicationRecord
  CONFIRMATION_SORT_VALUES = %w[name group].freeze

  belongs_to :user

  validates :confirmation_sort, inclusion: { in: CONFIRMATION_SORT_VALUES }, allow_blank: true

  def self.active_preferences
    %i[confirmation_sort]
  end

  def save_confirmation_sort(value)
    return unless CONFIRMATION_SORT_VALUES.include?(value)

    update!(confirmation_sort: value)
  end
end
