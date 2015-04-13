class Addindextoimages < ActiveRecord::Migration
  def change
  	add_column :images, :linkcat_id, :integer
  	add_column :images, :docstructure_id, :integer
  end
end
