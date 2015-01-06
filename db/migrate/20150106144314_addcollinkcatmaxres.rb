class Addcollinkcatmaxres < ActiveRecord::Migration
  def change
  	add_column :linkcats, :linkcatmaxres, :integer
  end
end
