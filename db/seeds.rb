# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.create(:email => 'admin@gmail.com', :username => 'admin', :password => 'Password123', :is_admin => true) if User.find_by_email('admin@gmail.com').blank?




Page.create(:reference => "faq", :title => "Faq's", :body => 'about the project')
Page.create(:reference => 'contact_us', :title => 'Contact Us', :body => 'contact us about the project')
Page.create(:reference => 'about_us', :title => 'About Us', :body => 'about the company and project')
Page.create(:reference => 'privacy_policy', :title => 'Privacy Policy', :body => 'about the private settings')
Page.create(:reference => 'terms_and_condition', :title => 'Terms & Condition', :body => 'conditions of the company')

