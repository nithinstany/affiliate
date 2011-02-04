class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
    @users  = User.all #all_users_without_admin
  end

  def show
    @user = User.find(params[:id], :include => {:transactions => :affiliate_merchant })
  end

  def payment_requests
     @user = User.find(params[:id], :include => [:payment_requests])
  end
end

