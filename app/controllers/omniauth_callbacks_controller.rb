# class SessionsController < ApplicationController
#   def create
#    user = User.from_omniauth(env['omniauth.auth'])
#    session[:user_id] = user.id
#    redirect_to root_url, notice: "Signed in."
#   end
# end
class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :twitter, :all
  alias_method :facebook, :all
end
