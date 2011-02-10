class Admin::PaymentRequestsController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
    if params[:state] == "pending"
      @payment_requests = PaymentRequest.pending_payments.order('state DESC')
    else
      @payment_requests = PaymentRequest.order('state DESC')
    end
  end




  def complete
    pr = PaymentRequest.find(params[:id])
    pr.update_attribute('state', 'completed')
    pr.user.update_attribute('withdrawals', (pr.user.withdrawals + pr.total_amount))

    redirect_to params[:u]? payment_requests_admin_user_path(params[:u]) :  admin_payment_requests_path
  end

end

