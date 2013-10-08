class CommonPagesController < ApplicationController
  layout "welcome", only: :welcome
  include UsersHelper
  def welcome
  	if signed_in?
  		@welcome = false
      @user = current_user
  		redirect_to home_path
  	else
  		@user = User.new
  		@welcome = true
  	end
  end

  def home
    @user = current_user
  end
end
