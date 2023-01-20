# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :users, dependent: :destroy
end
