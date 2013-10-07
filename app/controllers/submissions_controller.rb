class SubmissionsController < ApplicationController
	before_action :correct_submitter, only: [:show]
	before_action :signed_in_user, only: [:show, :showuser]
	def new
		@problem = OjProblem.find(params[:id])
	end
	def create
		@submission = Submission.new(code: params[:submission][:code], ojproblem_id: params[:id], oj_problem_id: params[:id], user_id: current_user.id, result: "Pending")
		if @submission.save 
			@submission.judge
			redirect_to @submission
		end
	end

	def show
		@submission = Submission.find(params[:id])
	end

	def showuser
		@submissions = current_user.submissions.paginate(page:params[:page])
	end

	private
	def correct_submitter
		@submission = Submission.find(params[:id])
		redirect_to subuser_path(@submission.user_id) unless @submission.user_id == current_user.id
	end
end
