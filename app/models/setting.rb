class Setting < ActiveRecord::Base

  def self.minimum_fee
    self.where(:reference => 'minimum_request_amount').first
  end
end

