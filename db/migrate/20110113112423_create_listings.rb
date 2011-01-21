class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.text :banner
      t.integer :category_id
      t.integer :affiliate_merchant_id

      t.timestamps
    end
    add_index :listings, :category_id
    add_index :listings, :affiliate_merchant_id
    add_index :listings, [:category_id, :affiliate_merchant_id]
  end

  def self.down
    drop_table :listings
  end
end

