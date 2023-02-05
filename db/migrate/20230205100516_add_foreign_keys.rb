# frozen_string_literal: true

class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :groups, :accounts
    add_foreign_key :items, :accounts
    add_foreign_key :items, :groups
    add_foreign_key :preferences, :users
    add_foreign_key :users, :accounts
  end
end
