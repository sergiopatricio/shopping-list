# frozen_string_literal: true

class UpdateIndexOnNameForGroupsAndItems < ActiveRecord::Migration[6.0]
  def change
    remove_index :groups, :name
    remove_index :items, :name

    add_index :groups, %i[user_id name], unique: true
    add_index :items, %i[user_id name], unique: true
  end
end
