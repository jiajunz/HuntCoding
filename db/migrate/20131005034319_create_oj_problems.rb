class CreateOjProblems < ActiveRecord::Migration
  def change
    create_table :oj_problems do |t|
      t.string :title
      t.text :description
      t.integer :level
      t.integer :correct_submission
      t.integer :total_submission
      t.string :tags
      
      t.timestamps
    end
  end
end
