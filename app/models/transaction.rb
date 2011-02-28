class Transaction < ActiveRecord::Base
  belongs_to :affiliate_merchant
  belongs_to :user

  scope :non_zero, where("commissions > ?", 0.00)

  def self.pull_report_from_linkshare
    link_share = AffiliateMerchant.find_by_name('Link Share')
    unless link_share.blank?
      unless link_share.end_date == Date.today
        start_date = Transaction.convert_date_to_string(link_share.end_date)
        end_date = Transaction.convert_date_to_string(Date.today)
        system("rm #{Rails.root}/public/link-share-report.txt") if File.exists?("#{Rails.root}/public/link-share-report.txt")
        #system("wget -O #{Rails.root}/public/link-share-report.txt -S \"http://cli.linksynergy.com/cli/publisher/reports/downloadReport.php?bdate=#{start_date}&edate=#{end_date}&cuserid=shashank123&cpi=isiritech99&eid=vXQMo6zjz3Y\"")
        system("wget -O #{Rails.root}/public/link-share-report.txt -S \"http://cli.linksynergy.com/cli/publisher/reports/downloadReport.php?bdate=#{start_date}&edate=#{end_date}&cuserid=skedilaya&cpi=Colorado11&eid=9i9EOPOu2kU\"")
        i = 0
        File.new("#{Rails.root}/public/link-share-report.txt").each_line do |line|
          if i > 0
            value = line.split(' ')
            member = User.find_by_key(value[0])
            if member && value[10].to_f > 0.00
              # becuase split error by space we will doing from reverse order
              reverse = line.reverse
              reverse_value = reverse.split(' ')

              tranactiondate = reverse_value[7].reverse.split('/')  #transction date "month/day/year"
              trans_date = tranactiondate[2] + '-' + tranactiondate[0] + '-'+ tranactiondate[1]

              processdate = reverse_value[1].reverse.split('/') #process date "month/day/year"
              proc_date = processdate[2] + '-' + processdate[0] + '-'+ processdate[1]

              status =  (proc_date.to_date <= Date.today)? 'cash-back available' : 'cash-back pending'
              link_share.transactions.create!(:user_id => member.id, :tranactiondate => trans_date , :commissions => reverse_value[2].reverse, :orderid => reverse_value[8].reverse,:sales => reverse_value[4].reverse , :status => status  )
              member.update_earnings
            end
          end
          i +=1
        end
        link_share.update_attribute('end_date', Date.today)
      end
    end

  end

  def self.convert_date_to_string(date)
    date.blank?? Date.today.to_s.split('-').join : date.to_s.split('-').join
  end

end

