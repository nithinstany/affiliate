class AddTransactionFeeToPaymentRequests < ActiveRecord::Migration
  def self.up
     add_column :payment_requests, :transaction_fee, :decimal, :precision => 8, :scale => 2, :default => 0.00
     add_column :payment_requests, :fixed_fee, :decimal, :precision => 8, :scale => 2, :default => 0.00
  end

  def self.down
  end
end

