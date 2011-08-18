class Notifier < ActionMailer::Base
 default  :from =>  %{admin@littlesurprizes.com}, :content_type => "text/html"

  def send_transaction_delails(transactions)
    @transactions = transactions
    mail(:to => 'admin@littlesurprizes.com', :subject => "Transaction Details - #{Date.today.strftime('%d %B %Y')}")
  end

  def send_payment_requests(payment_request)
    @payment_request = payment_request
    mail(:to => 'admin@littlesurprizes.com', :subject => 'new payment request')
  end


end

