# frozen_string_literal: true

class AddUniqueOnPreferencesUserId < ActiveRecord::Migration[7.0]
  def change
    remove_index :preferences, :user_id
    add_index :preferences, :user_id, unique: true
  end
end
