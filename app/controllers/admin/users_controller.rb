class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
    @users  = User.all_users_without_admin
  end

  def show
    @user = User.find(params[:id], :include => {:transactions => :affiliate_merchant })
  end

end

