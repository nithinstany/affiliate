class ListingsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @category = Category.find(params[:category_id], :include => :listings)
  end
#This is used to display the instructions for amazon
  def show
    @listing = Listing.find(params[:id])
    render :layout=>false
  end

end

