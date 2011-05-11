class Notifier < ActionMailer::Base
 default  :from =>  %{admin@littlesurprizes.com}, :content_type => "text/html"

  def send_transaction_delails(transactions)
    @transactions = transactions
    mail(:to => 'admin@littlesurprizes.com', :subject => "Transaction Details - #{Date.today.to_s}")
  end


end

