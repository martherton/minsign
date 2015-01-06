class Addcolumnlangwlink < ActiveRecord::Migration
  def change
  	add_column :wlinks, :wlinklang, :string
  end
end
