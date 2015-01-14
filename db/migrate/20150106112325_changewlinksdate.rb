class Changewlinksdate < ActiveRecord::Migration
  def change
  	change_column :wlinks, :wlinkyear, 'date USING CAST(wlinkyear AS date)'
  end
end
