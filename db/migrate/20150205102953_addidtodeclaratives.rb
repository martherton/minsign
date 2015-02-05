class Addidtodeclaratives < ActiveRecord::Migration
  def change
  	add_column :declaratives, :docstructure_id, :integer
  	add_column :declaratives, :linkcat_id, :integer
  end
end
