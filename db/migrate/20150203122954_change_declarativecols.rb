class ChangeDeclarativecols < ActiveRecord::Migration
  def change
  	change_column :declaratives, :linkcat_name, :integer
  	change_column :declaratives, :docstructure_name, :integer

		

  end
end
