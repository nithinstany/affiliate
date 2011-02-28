class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def method_missing(provider)
    if !User.omniauth_providers.index(provider).nil?
      #omniauth = request.env["omniauth.auth"]
      omniauth = env["omniauth.auth"]
      user = User.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

      if user
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
        sign_in user
        redirect_to root_path
      else
        user = User.new
        user.apply_omniauth(omniauth)
        if user.save(false)
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
          sign_in user
          redirect_to root_path
        else
          redirect_to new_user_registration_url
        end
      end

    end
  end

end

