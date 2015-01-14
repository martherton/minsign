class Changewlinksdate < ActiveRecord::Migration
  def change
  	change_column :wlinks, :wlinkyear, 'date USING CAST(column_name AS date)'
  end
end
