class AddEndDateToAffiliateMerchants < ActiveRecord::Migration
  def self.up
    add_column :affiliate_merchants, :end_date, :date
  end

  def self.down
    remove_column :affiliate_merchants, :end_date
  end
end
