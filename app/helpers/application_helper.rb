module ApplicationHelper

  def calculate_paid_total
    current_user.payment_requests.completed_payments.sum(:amount )+ current_user.payment_requests.completed_payments.sum(:transaction_fee)+current_user.payment_requests.completed_payments.sum(:fixed_fee)
  end

  def calculate_pending_total
    current_user.payment_requests.pending_payments.sum(:amount )+ current_user.payment_requests.pending_payments.sum(:transaction_fee)+current_user.payment_requests.pending_payments.sum(:fixed_fee)
  end

end

