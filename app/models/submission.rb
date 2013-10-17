class Submission < ActiveRecord::Base
	require 'fileutils'
	belongs_to :user
	belongs_to :oj_problem
	belongs_to :solvedproblem
	default_scope -> { order('created_at DESC')}
	validates :user_id, presence: true
	validates :oj_problem_id, presence: true

	def judge
		# create a submission directory if not exist
		submdir = Rails.root.join('tmp/submission'+self.id.to_s)
		dir = File.join(submdir,'/com/huntcoding')
		unless File.directory?(dir)
			FileUtils.mkdir_p(dir)
		end

		# copy the required files from db to the tmp folder
		hcstaticfiles_dir = Rails.root.join('lib/huntcoding/')
		FileUtils.cp_r Dir.glob(hcstaticfiles_dir.to_s+'*.java'), dir

	    # copy testrunner file
		testRunnerFile = File.join(dir, 'TestRunner.java')
		File.write(testRunnerFile, OjProblem.find(ojproblem_id).testrunner)
		solutionFile = File.join(dir, 'Solution.java')
		
		# process the code submitted add package and import
		# TODO maybe need to worry about someone define a nested class before solution class?
		start_pos = code.index('public')
		processed_code = "package com.huntcoding;\n import java.util.*; \n"
		if start_pos.nil?
			start_pos = 0;
		end
		processed_code = processed_code + code[start_pos, code.size]
		File.write(solutionFile, processed_code)

		# compile
		compile = `cd #{dir.to_s}; javac *.java 2>&1`

		# parse result
		if compile.blank? # compilation success
		   # run the program
		   test_result = `cd #{submdir.to_s}; java com.huntcoding.OJFrameWork 2>&1`
		   # TODO error handling on this json parse fail or split fail
		   json_result_str = test_result.split('\n').last
		   json_result = JSON.parse(json_result_str)
		   result = json_result["result"]
		   passed = json_result["passed"]
		   total = json_result["total"]
		   details = json_result["details"]
		   if result == "Passed"
		   	  self.solvedproblem.update(solved: true)
		   end
		   self.update(result: result, result_detail: details, pass: passed, total: total)
		else # compilation error
		   ind = compile.index(":")
		   end_index = compile[ind,compile.size].index("/")
		   if end_index.nil?
		   	   end_index = compile.size
		   end
		   logger.debug compile
		   details = compile[ind,end_index]
		   self.update(result: "Compile Failed", result_detail: details)
		end

		# remove the submission folder
		FileUtils.rm_rf(submdir)
	end
	handle_asynchronously :judge
end

