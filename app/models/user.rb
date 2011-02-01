class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable,:confirmable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable



  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:is_admin,:username,:remember_me, :name
  before_create :set_key
  has_many :transactions



  def apply_omniauth(omniauth)
    self.name = omniauth['user_info']['name'] if name.blank?
    self.provider = omniauth['provider']
    self.uid = omniauth['uid']
  end

  def self.all_users_without_admin
    find(:all, :conditions => ['is_admin = ? or is_admin IS NULL', 0])
  end

  def earnings_total_price
     self.transactions.sum(:commissions)
  end

  private

  def set_key
    self.key = ActiveSupport::SecureRandom.hex(40)
  end



end

