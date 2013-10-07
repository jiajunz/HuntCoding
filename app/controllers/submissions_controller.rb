class SubmissionsController < ApplicationController
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
		@submissions = User.find(params[:user_id]).submissions.paginate(page:params[:page])
	end
end
