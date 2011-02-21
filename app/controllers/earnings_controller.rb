class EarningsController < ApplicationController
  before_filter :authenticate_user!

  def index

    link_share = AffiliateMerchant.find_by_name('Link Share')
    unless link_share.blank?
      unless link_share.end_date == Date.today
        start_date = convert_date_to_string(link_share.end_date)
        end_date = convert_date_to_string(Date.today)
        system("rm #{Rails.root}/public/link-share-report.txt") if File.exists?("#{Rails.root}/public/link-share-report.txt")
        #system("wget -O #{Rails.root}/public/link-share-report.txt -S \"http://cli.linksynergy.com/cli/publisher/reports/downloadReport.php?bdate=#{start_date}&edate=#{end_date}&cuserid=shashank123&cpi=isiritech99&eid=vXQMo6zjz3Y\"")
        system("wget -O #{Rails.root}/public/link-share-report.txt -S \"http://cli.linksynergy.com/cli/publisher/reports/downloadReport.php?bdate=#{start_date}&edate=#{end_date}&cuserid=skedilaya&cpi=Colorado11&eid=9i9EOPOu2kU\"")
        i = 0
        File.new("#{Rails.root}/public/link-share-report.txt").each_line do |line|
          if i > 0
            value = line.split(' ')
            member = User.find_by_key(value[0])
            if member && value[10].to_f > 0.00

              tranactiondate = value[5].split('/')  #transction date "month/day/year"
              trans_date = tranactiondate[2] + '-' + tranactiondate[0] + '-'+ tranactiondate[1]

              processdate = value[11].split('/') #process date "month/day/year"
              proc_date = processdate[2] + '-' + processdate[0] + '-'+ processdate[1]

              status =  (Time.parse(proc_date.to_s).strftime("%Y-%d-%m").to_date <= Date.today)? 'cash-back available' : 'cash-back pending'
              link_share.transactions.create!(:user_id => member.id, :tranactiondate => trans_date , :commissions => value[10], :orderid => value[4],:sales => value[8] , :status => status  )
            end
          end
          i +=1
        end
        link_share.update_attribute('end_date', Date.today)
      end
    end
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

