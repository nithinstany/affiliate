class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => true
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.string :first_name
      t.string :last_name
      t.text   :address
      t.string :paypal_id
      t.timestamps
    end

    add_index :users, :email
    add_index :users, :confirmation_token
    add_index :users, :reset_password_token
    # add_index :users, :unlock_token,         :unique => true

  end
#User.create(:email => 'admin@gmail.com', :username => 'admin', :password => 'Password123', :is_admin => true)
  def self.down
    drop_table :users
  end
end

