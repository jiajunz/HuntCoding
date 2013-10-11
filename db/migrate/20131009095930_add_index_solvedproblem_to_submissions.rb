class AddIndexSolvedproblemToSubmissions < ActiveRecord::Migration
  def change
  	add_column :submissions, :solvedproblem_id, :integer
  	add_index :submissions, :solvedproblem_id
  end
end
