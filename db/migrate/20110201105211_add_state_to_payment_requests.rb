class AddStateToPaymentRequests < ActiveRecord::Migration
  def self.up
    add_column :payment_requests, :state, :string, :default => 'pending'
  end

  def self.down
    remove_column :payment_requests, :state
  end
end

