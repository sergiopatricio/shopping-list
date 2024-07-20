# frozen_string_literal: true

class AddDatabaseNullConstraints < ActiveRecord::Migration[6.0]
  def change
    # rubocop:disable Rails/BulkChangeTable
    change_column_null(:groups, :name, false)
    change_column_null(:groups, :user_id, false)

    change_column_null(:items, :group_id, false)
    change_column_null(:items, :name, false)
    change_column_null(:items, :user_id, false)
    # rubocop:enable Rails/BulkChangeTable
  end
end
