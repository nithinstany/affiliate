class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :name
      t.string :reference
      t.string :value

      t.timestamps
    end
    Setting.create(:name => 'Minimum request amount' , :reference => 'minimum_request_amount', :value => '10')
    Setting.create(:name => 'transaction fees' , :reference => 'transaction_fee', :value => '0.03')
    Setting.create(:name => 'Affiliate fee' , :reference => 'fixed_fee', :value => '1')
  end

  def self.down
    drop_table :settings
  end
end

