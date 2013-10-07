class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :code
      t.integer :user_id
      t.integer :ojproblem_id

      t.timestamps
    end
    add_index :submissions, [:user_id, :created_at]
  end
end
