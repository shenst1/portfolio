# class SessionsController < ApplicationController
#   def create
#    user = User.from_omniauth(env['omniauth.auth'])
#    session[:user_id] = user.id
#    redirect_to root_url, notice: "Signed in."
#   end
# end
class ServiceCallbacksController < ApplicationController

  def twitter
    account = TwitterAccount.from_omniauth(request.env["omniauth.auth"])
    if account.persisted?
      flash.notice = "Twitter has successfully been connected."
      redirect_to settings_path
    else
      redirect_to settings_path
    end
  end
end
