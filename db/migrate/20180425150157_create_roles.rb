class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name, null: false, limit: 50
      t.text :description
      t.integer :sort, null: false, default: 0
      t.boolean :default, null: false, default: false
      t.boolean :active, null: false, default: true
      t.boolean :deleted, null: false, default: false
    end
  end
end
