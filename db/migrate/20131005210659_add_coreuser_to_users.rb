class AddCoreuserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coreuser, :boolean, default: false
  end
end
