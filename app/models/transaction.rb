class Transaction < ActiveRecord::Base
  belongs_to :affiliate_merchant
  belongs_to :user



end

