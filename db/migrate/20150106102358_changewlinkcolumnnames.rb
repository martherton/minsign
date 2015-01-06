class Changewlinkcolumnnames < ActiveRecord::Migration
  def change
  	rename_column :wlinks, :year, :wlinkyear
  	rename_column :wlinks, :source, :wlinksource
  end
end
