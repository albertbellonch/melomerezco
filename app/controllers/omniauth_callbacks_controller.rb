class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_or_create_for_oauth(request.env["omniauth.auth"])
    sign_in @user

    redirect_to root_path
  end
end
