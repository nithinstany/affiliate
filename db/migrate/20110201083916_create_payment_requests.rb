class CreatePaymentRequests < ActiveRecord::Migration
  def self.up
    create_table :payment_requests do |t|
      t.integer :user_id
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.00

      t.timestamps
    end
    add_index :payment_requests, :user_id
  end

  def self.down
    drop_table :payment_requests
  end
end

