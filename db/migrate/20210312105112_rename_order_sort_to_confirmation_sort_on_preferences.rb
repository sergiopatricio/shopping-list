# frozen_string_literal: true

class RenameOrderSortToConfirmationSortOnPreferences < ActiveRecord::Migration[6.1]
  def change
    rename_column :preferences, :order_sort, :confirmation_sort
  end
end
