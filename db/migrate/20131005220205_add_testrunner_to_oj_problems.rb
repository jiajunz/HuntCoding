class AddTestrunnerToOjProblems < ActiveRecord::Migration
  def change
    add_column :oj_problems, :testrunner, :text
  end
end
