class UsersController < ApplicationController
	  before_action :signed_in_user, only:[:index, :edit, :update, :show]
    before_action :correct_user, only: [:edit, :update, :show]
    before_action :admin_user, only: [:index, :destroy]
	
	def new
		@user = User.new
	end

  def index
    @users = User.paginate(page:params[:page])
  end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
		flash[:success] = "Welcome!"
		hc_sign_in @user
		redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
    end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

 def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
 end


  private

    def user_params
    	params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user.id==@user.id
    end

  def admin_user
    redirect_to(root_url) unless current_user.coreuser?
  end
end
