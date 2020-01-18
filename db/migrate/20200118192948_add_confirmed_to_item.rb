class AddConfirmedToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :confirmed, :boolean, default: false
  end
end
