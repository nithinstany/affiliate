class AffiliateMerchant < ActiveRecord::Base
  has_many :listings
  has_many :transactions
  validates_presence_of :name

  def total_earnings
     transactions.sum(:commissions)
  end

end

