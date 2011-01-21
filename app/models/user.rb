class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable,:confirmable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable



  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:is_admin,:username,:remember_me
  before_create :set_key

  scope :all_users_without_admin, :conditions => { :is_admin => 0 }

  def apply_omniauth(omniauth)
    self.first_name = omniauth['user_info']['name'] if first_name.blank?
    self.provider = omniauth['provider']
    self.uid = omniauth['uid']
  end

  private

  def set_key
    self.key = ActiveSupport::SecureRandom.hex(40)
  end



end

