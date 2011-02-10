class PaymentRequest < ActiveRecord::Base
  belongs_to :user
  scope :pending_payments, where(:state => 'pending')
  scope :completed_payments, where(:state => 'completed')

  scope :total, select('sum(amount) as amount')
  scope :total_trans_fee_earned, select('sum(transaction_fee) as amount')
  scope :total_fixed_fee, select('sum(fixed_fee) as amount')

  def self.total_transaction_fee
    self.completed_payments.total_trans_fee_earned.first.amount + self.completed_payments.total_fixed_fee.first.amount rescue 0
  end

  def total_amount #
    amount + transaction_fee + fixed_fee
  end

end

