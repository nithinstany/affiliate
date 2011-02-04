class PaymentRequest < ActiveRecord::Base
  belongs_to :user
  scope :pending_payments, where(:state => 'pending')
  scope :total, select('sum(amount) as amount')
end

