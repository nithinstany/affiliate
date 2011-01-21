class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
    @users  = User.all_users_without_admin
  end

end

