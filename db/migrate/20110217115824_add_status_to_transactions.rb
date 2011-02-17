class AddStatusToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :status, :string
  end

  def self.down
    remove_column :transactions, :status
  end
end

