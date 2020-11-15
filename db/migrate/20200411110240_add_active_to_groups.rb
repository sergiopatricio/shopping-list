# frozen_string_literal: true

class AddActiveToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :active, :boolean, default: true
  end
end
