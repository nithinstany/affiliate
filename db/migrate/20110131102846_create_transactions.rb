class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :affiliate_merchant_id
      t.decimal :commissions, :precision => 8, :scale => 2
      t.date :process_date

      t.timestamps
    end
    add_index :transactions, :user_id
    add_index :transactions, :affiliate_merchant_id
  end

  def self.down
    drop_table :transactions
  end
end

