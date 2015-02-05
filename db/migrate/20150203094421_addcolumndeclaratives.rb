class Addcolumndeclaratives < ActiveRecord::Migration
  def change
  	add_column :declaratives, :linkcat_name, :string
  	add_column :declaratives, :docstructure_name, :string
  end
end
