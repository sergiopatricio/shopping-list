# frozen_string_literal: true

class UpdateIndexOnNameForItems < ActiveRecord::Migration[6.0]
  def change
    remove_index :items, %i[user_id name]
    add_index :items, %i[group_id name], unique: true
  end
end
