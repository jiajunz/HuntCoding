class SessionsController < ApplicationController
  def new
  	# render a signin page
    if signed_in?
       redirect_to current_user
    end      
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		hc_sign_in user
  		redirect_back_or user
  	else
  		flash.now[:error] = 'Invalud email/password combination'
  		render 'new'
  	end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
