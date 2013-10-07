class AddIndexToSubmissions < ActiveRecord::Migration
  def change
    add_index :submissions, [:ojproblem_id, :created_at]
  end
end
