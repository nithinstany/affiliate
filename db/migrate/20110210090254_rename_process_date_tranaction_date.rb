class RenameProcessDateTranactionDate < ActiveRecord::Migration
  def self.up
    rename_column :transactions, :process_date, :tranactiondate
  end

  def self.down
  end
end

