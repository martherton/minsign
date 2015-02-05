class RenameDeclarativecols < ActiveRecord::Migration
  def change
  	rename_column :declaratives, :docstructure_name, :docstructure_id
  	rename_column :declaratives, :linkcat_name, :linkcat_id
  end
end
