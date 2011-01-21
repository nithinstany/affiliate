class AddKeyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :key, :string
    add_index :users, :key,         :unique => true
  end

  def self.down
    remove_column :users, :key
  end
end

