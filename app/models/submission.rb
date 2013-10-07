class Submission < ActiveRecord::Base
	belongs_to :user
	belongs_to :oj_problem
	default_scope -> { order('created_at DESC')}
	validates :user_id, presence: true
	validates :oj_problem_id, presence: true

	def judge
		driverFileOrig = Rails.root.join('public/OJFrameWork.java')
		driverFile = Rails.root.join('tmp/OJFrameWork.java')
		tmp = Rails.root.join('tmp')
		testRunnerFile = Rails.root.join('tmp/TestRunner.java')
		solutionFile = Rails.root.join('tmp/Solution.java')
		File.write(testRunnerFile, OjProblem.find(ojproblem_id).testrunner)
		File.write(solutionFile, code)
		`cp #{driverFileOrig.to_s} #{driverFile.to_s}`
		compile = `javac #{driverFile.to_s} #{testRunnerFile.to_s} #{solutionFile.to_s} 2>&1`
		if compile.blank?
		   if code.index("import") >= 0
		   	  test_result = "for now do not support import"
		   else
		      test_result = `cd #{tmp.to_s}; java OJFrameWork 2>&1`
		   end
		   self.update(result: test_result, result_detail: "TODO")
		else #compiler error
		   ind = compile.index(":")
		   end_index = compile[ind,compile.size].index("/")
		   if end_index.nil?
		   	   end_index = compile.size
		   end
		   logger.debug compile
		   details = compile[ind,end_index]
		   self.update(result: "Compile Failed", result_detail: details)
		end
	end
	#handle_asynchronously :judge
end

