# frozen_string_literal: true

class RenamePreferencesToUserConfigurations < ActiveRecord::Migration[7.1]
  def change
    rename_table :preferences, :user_configurations
    change_table :user_configurations do |t|
      t.change_null :user_id, false
      t.change_null :confirmation_sort, false, ''
      t.change_default :confirmation_sort, from: nil, to: 'name'
    end
  end
end
