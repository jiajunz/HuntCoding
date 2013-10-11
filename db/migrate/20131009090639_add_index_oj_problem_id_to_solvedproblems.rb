class AddIndexOjProblemIdToSolvedproblems < ActiveRecord::Migration
  def change
  	    add_index :solvedproblems, [:user_id, :oj_problem_id]
  end
end
