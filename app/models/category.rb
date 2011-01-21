class Category < ActiveRecord::Base
  has_many :listings
  validates_presence_of :name
end

