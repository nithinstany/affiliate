ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "littlesurprizes.com",
  :user_name => "lil.surprizes",
  :password => "surprize123",
  :authentication => "plain",
  :enable_starttls_auto => true
}

