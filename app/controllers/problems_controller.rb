class ProblemsController < ApplicationController
  before_action :core_user, only: [:new,:create,:destroy, :show]
  before_action :signed_in_user, only:[:index]
  def index
  	@problems = OjProblem.paginate(page:params[:page])
  end

  def show
    @problem = OjProblem.find(params[:id])
  end

  def new
  	@problem = OjProblem.new
  end

  def create
  	@problem = OjProblem.new(problem_params)
  	if @problem.save
  		redirect_to problems_path
  	else
  		render "new"
  	end
  end

  def destroy
    OjProblem.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to problems_url
  end



  private
  def core_user
  	@user = current_user
    redirect_to(root_url) unless @user&&@user.coreuser?
  end

  def problem_params
  	params.require(:oj_problem).permit(:title, :description, :testrunner, :stub)
  end
end
