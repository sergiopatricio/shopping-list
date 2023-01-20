# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, &:timestamps

    add_reference :users, :account
    add_reference :groups, :account
    add_reference :items, :account

    fill_accounts

    add_index :groups, %i[account_id name], unique: true

    change_column_null(:users, :account_id, false)
    change_column_null(:groups, :account_id, false)
    change_column_null(:items, :account_id, false)
  end

  private

  def fill_accounts
    User.find_each do |user|
      account = Account.create!
      user.update!(account: account)
      Group.where(user_id: user.id).update_all(account_id: account.id)
      Item.where(user_id: user.id).update_all(account_id: account.id)
    end
  end
end
