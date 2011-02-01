class EarningsController < ApplicationController
  before_filter :authenticate_user!

  def index
    link_share = AffiliateMerchant.find_by_name('Link Share')
    unless link_share.blank?
      start_date = convert_date_to_string(link_share.end_date)
      end_date = convert_date_to_string(Date.today)

      system("rm #{Rails.root}/public/link-share-report.txt") if File.exists?("#{Rails.root}/public/link-share-report.txt")
      system("wget -O #{Rails.root}/public/link-share-report.txt -S \"http://cli.linksynergy.com/cli/publisher/reports/downloadReport.php?bdate=#{start_date}&edate=#{end_date}&cuserid=shashank123&cpi=isiritech99&eid=vXQMo6zjz3Y\"")
      i = 0
      File.new("#{Rails.root}/public/link-share-report.txt").each_line do |line|
        if i > 0
          value = line.split(' ')
          member = User.find_by_key(value[0])
          if member
            date = value[11].split('/').reverse!.join('-')
            link_share.transactions.create!(:user_id => member.id, :process_date => date , :commissions => value[10] )
          end
        end
        i +=1
      end
      link_share.update_attribute('end_date', Date.today)
    end
    current_user.update_earnings
  end

  def create
    if params[:paypal_payer_id].blank? || current_user.remaining_earnings < params[:amount].to_f
      flash[:notice] = 'please enter all fields.'
      redirect_to :back
    else
      if current_user.paypal_info.blank?
        PaypalInfo.create(:paypal_id => params[:paypal_payer_id], :user_id => current_user.id)
      else
        current_user.paypal_info.update_attributes({:paypal_id => params[:paypal_payer_id]})
      end
      current_user.create_payment_request(params[:amount])
      flash[:notice] = "Request for payment withdrawal is made."
      redirect_to :back
    end
  end


  private

  def convert_date_to_string(date)
    date.blank?? Date.today.to_s.split('-').join : date.to_s.split('-').join
  end

end

