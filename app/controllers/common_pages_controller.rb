class CommonPagesController < ApplicationController
  include UsersHelper
  def welcome
  	if signed_in?
  		@welcome = false
      @user = current_user
  		render 'home'
  	else
  		@user = User.new
  		@welcome = true
  	end
  end

  def home
  end
end
