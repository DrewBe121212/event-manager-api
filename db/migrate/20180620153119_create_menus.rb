class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.references :parent, index: true
      t.string :title, null: false, limit: 100
      t.string :url, null: false, limit: 100
      t.string :icon, limit: 50
      t.string :authorize_perform, limit: 50
      t.string :authorize_on, limit: 50
      t.integer :sort, null: false, default: 0
      t.boolean :visible, null: false, default: true
      t.boolean :active, null: false, default: true
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end
end
