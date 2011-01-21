class AddNameFieldToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    remove_column :users, :first_name
    remove_column :users, :last_name
  end

  def self.down
    remove_column :users, :name
  end
end

