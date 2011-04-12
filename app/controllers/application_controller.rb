class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    if current_user && current_user.is_admin?
      root_path
    else
      root_path
    end
  end

  def require_admin
    if current_user && current_user.is_admin?
      true
    else
      redirect_to root_path, :notice => "Don't have administrative privileges."
    end
  end

end

