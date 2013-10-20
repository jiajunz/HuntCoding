class AddPythontestAndPythonstubToOjProblems < ActiveRecord::Migration
  def change
  	add_column :oj_problems, :pythontest, :text
    add_column :oj_problems, :pythonstub, :text
  end
end
