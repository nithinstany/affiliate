class Admin::PaymentRequestsController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
    @payment_requests = PaymentRequest.order('state DESC')
  end

  def complete
    pr = PaymentRequest.find(params[:id])
    pr.update_attribute('state', 'completed')
    pr.user.update_attribute('withdrawals', (pr.user.withdrawals + pr.amount))
    redirect_to admin_payment_requests_path
  end

end

