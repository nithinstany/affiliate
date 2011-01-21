class CreateAffiliateMerchants < ActiveRecord::Migration
  def self.up
    create_table :affiliate_merchants do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliate_merchants
  end
end
