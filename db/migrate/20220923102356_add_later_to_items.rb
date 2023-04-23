# frozen_string_literal: true

class AddLaterToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :later, :boolean, default: false # rubocop:disable Rails/ThreeStateBooleanColumn
  end
end
