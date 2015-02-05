class Addreleasecolumntolinkcat < ActiveRecord::Migration
  def change
  	add_column :linkcats, :released, :boolean
  end
end
