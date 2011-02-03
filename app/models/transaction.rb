class Transaction < ActiveRecord::Base
  belongs_to :affiliate_merchant
  belongs_to :user

  scope :non_zero, where("commissions > ?", 0.00)



end

