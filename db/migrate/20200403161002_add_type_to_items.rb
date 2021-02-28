# frozen_string_literal: true

class AddTypeToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :type, :string
    up_only do
      # Item::Base.update_all(type: 'Item::Regular')
    end
    change_column_null(:items, :type, false)
  end
end
