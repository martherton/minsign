class Changewlinksdate < ActiveRecord::Migration
  def change
  	change_column :wlinks, :wlinkyear, :date
  end
end
