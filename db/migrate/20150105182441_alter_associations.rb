class AlterAssociations < ActiveRecord::Migration
  def change
  	add_column :wlinks, :user_id, :integer
  	add_column :wlinks, :linkcat_id, :integer
  	add_column :finds, :user_id, :integer
  	add_column :finds, :linkcat_id, :integer
  	remove_column :wlinks, :wlinklog_id
  	remove_column :wlinks, :wlinklog_type
  	remove_column :finds, :activitylog_id
  	remove_column :finds, :activitylog_type
  end
end
