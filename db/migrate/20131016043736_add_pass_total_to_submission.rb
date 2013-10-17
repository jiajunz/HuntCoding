class AddPassTotalToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :pass, :integer
    add_column :submissions, :total, :integer
  end
end
