class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :affiliate_merchant
  validates_presence_of :category_id, :message =>  "Please select Category"
  validates_presence_of :affiliate_merchant_id, :message =>  "Please select Merchant"
  validates_presence_of :banner



end

