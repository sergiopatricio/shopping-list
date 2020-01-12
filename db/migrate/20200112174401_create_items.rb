class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :group
      t.string :name
      t.integer :position
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
