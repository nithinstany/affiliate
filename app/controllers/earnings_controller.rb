class EarningsController < ApplicationController
  before_filter :authenticate_user!

  def index
    Transaction.pull_report_from_linkshare
    current_user.update_earnings
  end

  def create
    if params[:amount].to_f < Setting.minimum_fee.value.to_f
      flash[:notice] = 'you enterd below the minimum Fee.'
      redirect_to :back and return
    end
    if params[:paypal_payer_id].blank? || params[:amount].blank? || current_user.available_for_withdrawal < params[:amount].to_f
      flash[:notice] = 'please enter all fields.'
      flash[:notice] = 'you enterd more than amount awailable for withdrawal' if current_user.available_for_withdrawal < params[:amount].to_f
      redirect_to :back and return
    else
      if current_user.paypal_info.blank?
        PaypalInfo.create(:paypal_id => params[:paypal_payer_id], :user_id => current_user.id)
      else
        current_user.paypal_info.update_attributes({:paypal_id => params[:paypal_payer_id]})
      end
      current_user.create_payment_request(params[:amount].to_f)
      flash[:notice] = "You have requested to for a withdrawal of $#{params[:amount]}. Your paypal account will be credited witin two days."
      redirect_to earnings_path
    end
  end


  private

  def convert_date_to_string(date)
    date.blank?? Date.today.to_s.split('-').join : date.to_s.split('-').join
  end

end

