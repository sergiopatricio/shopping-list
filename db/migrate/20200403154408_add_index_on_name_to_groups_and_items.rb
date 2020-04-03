class AddIndexOnNameToGroupsAndItems < ActiveRecord::Migration[6.0]
  def change
    add_index :groups, :name, unique: true
    add_index :items, :name, unique: true
  end
end
