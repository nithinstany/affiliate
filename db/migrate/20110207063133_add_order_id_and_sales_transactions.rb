class AddOrderIdAndSalesTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :orderid, :string
    add_column :transactions, :sales , :decimal, :precision => 8, :scale => 2, :default => 0.00
  end

  def self.down
  end
end

