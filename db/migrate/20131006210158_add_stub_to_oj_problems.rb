class AddStubToOjProblems < ActiveRecord::Migration
  def change
    add_column :oj_problems, :stub, :text
  end
end
