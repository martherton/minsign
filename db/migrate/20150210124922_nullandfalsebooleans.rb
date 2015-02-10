class Nullandfalsebooleans < ActiveRecord::Migration
  def change
  	change_column_null :declaratives, :entryend, false, 0
  	
  end
end
