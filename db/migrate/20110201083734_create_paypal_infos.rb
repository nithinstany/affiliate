class CreatePaypalInfos < ActiveRecord::Migration
  def self.up
    create_table :paypal_infos do |t|
      t.integer :user_id
      t.string :paypal_id

      t.timestamps
    end
    add_index :paypal_infos, :user_id
  end

  def self.down
    drop_table :paypal_infos
  end
end

