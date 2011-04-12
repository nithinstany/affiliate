class ListingsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @category = Category.find(params[:category_id], :include => :listings)
  end
#This is used to display the instructions for amazon
  def show
    unless current_user.blank?
    @listing = Listing.find(params[:id])
    
  else
     redirect_to new_user_session_path
   end
  end

end

