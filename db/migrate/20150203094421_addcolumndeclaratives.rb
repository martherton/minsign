class Addcolumndeclaratives < ActiveRecord::Migration
  def change
  	add_column :declaratives, :linkcat_id, :integer
  	add_column :declaratives, :docstructure_id, :integer
  end
end
