class CreateSolvedproblems < ActiveRecord::Migration
  def change
    create_table :solvedproblems do |t|
      t.integer :oj_problem_id
      t.integer :user_id
      t.boolean :solved, default:false
      t.integer :faved
      t.text :notes

      t.timestamps
    end
    add_index :solvedproblems, :user_id
  end
end
