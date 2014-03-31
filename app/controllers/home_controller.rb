class HomeController < ApplicationController
  before_filter :twitter

  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
  end
end
