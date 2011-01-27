class ListingsController < ApplicationController
  def index
    @category = Category.find(params[:category_id], :include => :listings)
  end

end

