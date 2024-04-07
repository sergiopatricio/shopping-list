# frozen_string_literal: true

class UserConfiguration < ApplicationRecord
  CONFIRMATION_SORT_VALUES = %w[name group].freeze

  belongs_to :user

  validates :confirmation_sort, inclusion: { in: CONFIRMATION_SORT_VALUES }, allow_blank: true
end
