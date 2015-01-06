class Addcolumnlinkcat < ActiveRecord::Migration
  def change
  	add_column :linkcats, :linkcatview, :string
  end
end
