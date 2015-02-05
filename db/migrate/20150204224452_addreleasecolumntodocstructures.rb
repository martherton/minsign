class Addreleasecolumntodocstructures < ActiveRecord::Migration
  def change
  	add_column :docstructures, :released, :boolean

  end
end
