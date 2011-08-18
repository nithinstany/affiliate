class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable,:confirmable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :total_withdrawals, select('sum(withdrawals) as amount')

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:is_admin,:username,:remember_me, :name, :address, :paypal_info_attributes
  before_create :set_key
  has_many :transactions
  has_one :paypal_info
  has_many :payment_requests
  accepts_nested_attributes_for :paypal_info


  def apply_omniauth(omniauth)
    self.name = omniauth['user_info']['name'] if name.blank?
    self.provider = omniauth['provider']
    self.uid = omniauth['uid']
  end

  def self.all_users_without_admin
    all.where('is_admin = ? or is_admin IS NULL', 0)
  end

  def earnings_total_price
     self.transactions.sum(:commissions)
  end

  def update_earnings
    self.update_attribute('earnings',  self.transactions.sum(:commissions))
  end

  def remaining_earnings
    self.earnings.to_f - self.withdrawals.to_f
  end

  def available_for_withdrawal
 self.earnings.to_f - self.withdrawals.to_f - (self.payment_requests.pending_payments.total.first.amount.to_f + self.payment_requests.pending_payments.total_trans_fee_earned.first.amount.to_f + self.payment_requests.pending_payments.total_fixed_fee.first.amount.to_f)
  end


=begin
  def available_for_withdrawal
    self.earnings.to_f - self.withdrawals.to_f - (self.payment_requests.pending_payments.total.first.amount.to_f - self.payment_requests.pending_payments.total_trans_fee_earned.first.amount.to_f - self.payment_requests.pending_payments.total_fixed_fee.first.amount.to_f)
  end
=end
  def name_or_email
    name.blank?? email : name
  end

  def create_payment_request(amount)
    transaction_fee =  Setting.find_by_reference('transaction_fee')
    fixed_fee = Setting.find_by_reference('fixed_fee')
    amt_tranfee = (amount * transaction_fee.value.to_f)/100.00

    final_amount = (amount - amt_tranfee - fixed_fee.value.to_f)
    payment_requests.create(:amount => final_amount, :transaction_fee => amt_tranfee, :fixed_fee => fixed_fee.value.to_f )
  end




  private

  def set_key
    self.key = ActiveSupport::SecureRandom.hex(40)
  end
end

