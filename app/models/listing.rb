class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :affiliate_merchant

  scope :featured, :conditions => { :featured => true }
end

