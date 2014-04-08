 class BetausersController < ApplicationController
  def create
    @betauser = Betauser.create!(safe_params)
    flash[:notice] = 'Boom. Thank you!'
    redirect_to root_path

  end

  def safe_params
    params.require(:betauser).permit(:email)
  end
end
