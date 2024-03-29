class SubmissionsController < ApplicationController
	before_action :correct_submitter, only: [:show]
	before_action :signed_in_user, only: [:show, :showuser]
	def new
		@problem = OjProblem.find(params[:id])
	end

	def create
			solvedproblem = Solvedproblem.where(user_id:current_user.id).where(oj_problem_id: params[:id]).first
			if solvedproblem.nil?
				solvedproblem = current_user.solvedproblems.create(oj_problem_id:params[:id])
				@submission = solvedproblem.submissions.create(code: params[:submission][:code], ojproblem_id: params[:id], oj_problem_id: params[:id], result: "Pending",user_id:current_user.id, pass:0,total:1,language: params[:submission][:language])
			else
				@submission = solvedproblem.submissions.create(code: params[:submission][:code], ojproblem_id: params[:id], oj_problem_id: params[:id], result: "Pending",user_id:current_user.id, pass:0,total:1,language: params[:submission][:language])			
				solvedproblem.submissions << @submission
				solvedproblem.save
			end
		    if @submission.save 
				redirect_to @submission
			end
	end

	def judgesubmission
		@submission = Submission.find(params[:id])
		@submission.judge
		@submission = Submission.find(params[:id])
		p "finished judge"
		respond_to do |format|
			format.js
		end
	end

	def show
		@submission = Submission.find(params[:id])
	end

	def showuser
		@submissions = current_user.submissions.paginate(page:params[:page])
	end

	def showmysub
		@solvedproblem = Solvedproblem.where(user_id:current_user.id).where(oj_problem_id:params[:id]).first
	end

	private
	def correct_submitter
		@submission = Submission.find(params[:id])
		redirect_to subuser_path(@submission.user_id) unless @submission.user_id == current_user.id
	end
end
