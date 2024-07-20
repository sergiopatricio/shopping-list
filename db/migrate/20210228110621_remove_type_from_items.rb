# frozen_string_literal: true

class RemoveTypeFromItems < ActiveRecord::Migration[6.1]
  def up
    remove_column :items, :type
  end

  def down
    # rubocop:disable Rails/BulkChangeTable
    add_column :items, :type, :string
    # Item::Base.update_all(type: 'Item::Regular')
    change_column_null(:items, :type, false)
    # rubocop:enable Rails/BulkChangeTable
  end
end
