# frozen_string_literal: true

class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.belongs_to :user
      t.string :order_sort

      t.timestamps
    end
  end
end
