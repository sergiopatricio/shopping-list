class AddTypeToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :type, :string
    Item::Base.update_all(type: 'Item::Regular')
    change_column_null(:items, :type, false)
  end
end
