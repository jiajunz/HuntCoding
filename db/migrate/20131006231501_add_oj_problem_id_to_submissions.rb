class AddOjProblemIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :oj_problem_id, :integer
    add_index :submissions, [:oj_problem_id, :created_at]
    end
end
