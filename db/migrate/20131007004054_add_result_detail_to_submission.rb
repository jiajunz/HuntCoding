class AddResultDetailToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :result_detail, :text
  end
end
