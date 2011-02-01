class AddEarningsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :earnings, :decimal, :precision => 8, :scale => 2, :default => 0.00
    add_column :users, :withdrawals, :decimal, :precision => 8, :scale => 2, :default => 0.00
  end

  def self.down
    remove_column :users, :earnings
  end
end

