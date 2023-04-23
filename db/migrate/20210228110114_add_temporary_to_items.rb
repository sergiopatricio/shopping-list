# frozen_string_literal: true

class AddTemporaryToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :temporary, :boolean, default: false # rubocop:disable Rails/ThreeStateBooleanColumn
    up_only do
      # Item::Base.where(type: 'Item::Temporary').update_all(temporary: true)
    end
  end
end
