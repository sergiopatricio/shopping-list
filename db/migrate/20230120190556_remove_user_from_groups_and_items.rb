# frozen_string_literal: true

class RemoveUserFromGroupsAndItems < ActiveRecord::Migration[7.0]
  def up
    remove_reference :groups, :user
    remove_reference :items, :user
  end

  def down
    add_reference :groups, :user
    add_reference :items, :user

    fill_users

    add_index :groups, %i[user_id name], unique: true

    change_column_null(:groups, :user_id, false)
    change_column_null(:items, :user_id, false)
  end

  private

  def fill_users
    Account.find_each do |account|
      # assign to first user
      user = account.users.first
      Group.where(account_id: account.id).update_all(user_id: user.id)
      Item.where(account_id: account.id).update_all(user_id: user.id)
    end
  end
end
