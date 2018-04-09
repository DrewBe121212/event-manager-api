class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 30
      t.string :email, null: false, limit: 100
      t.string :password_digest, null: false, limit: 100
      t.string :first_name, null: false, limit: 50
      t.string :middle_name, null: true, limit: 50
      t.string :last_name, null: false, limit: 50
      t.boolean :sso, null: false, default: false
      t.boolean :active, null: false, default: false
      t.string :reset_password_token, null: true, limit: 100
      t.datetime :reset_password_sent_at, null: true
      t.datetime :current_sign_in_at, null: true
      t.datetime :last_sign_in_at, null: true
      t.string :confirmation_token, null: true, limit: 100
      t.datetime :confirmed_at, null: true
      t.datetime :confirmation_sent_at, null: true
      t.string :unconfirmed_email, null: true, limit: 100

      t.timestamps
    end

    add_index(:users, :username, unique: true)
    add_index(:users, :email, unique: true)
    
  end
end





