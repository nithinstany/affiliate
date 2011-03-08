class ListingsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @category = Category.find(params[:category_id], :include => :listings)
  end

end

