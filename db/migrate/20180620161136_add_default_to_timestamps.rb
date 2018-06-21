class AddDefaultToTimestamps < ActiveRecord::Migration[5.1]
  change_table :users do |t|
    t.change :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    t.change :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end

  change_table :user_roles do |t|
    t.change :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    t.change :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end

  change_table :menus do |t|
    t.change :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    t.change :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end  
end
