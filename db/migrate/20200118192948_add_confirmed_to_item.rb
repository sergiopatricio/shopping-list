# frozen_string_literal: true

class AddConfirmedToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :confirmed, :boolean, default: false # rubocop:disable Rails/ThreeStateBooleanColumn
  end
end
