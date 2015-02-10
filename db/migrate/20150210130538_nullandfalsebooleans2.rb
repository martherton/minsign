class Nullandfalsebooleans2 < ActiveRecord::Migration
  def change
  	change_column_null :declaratives, :sandbox, false, 0
  end
end
