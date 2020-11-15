# frozen_string_literal: true

class Preference < ApplicationRecord
  ORDER_SORT_VALUES = %w[name group].freeze

  belongs_to :user

  validates :order_sort, inclusion: { in: ORDER_SORT_VALUES }, allow_blank: true

  def self.active_preferences
    %i[order_sort]
  end

  def save_order_sort(value)
    return unless ORDER_SORT_VALUES.include?(value)

    update!(order_sort: value)
  end
end
