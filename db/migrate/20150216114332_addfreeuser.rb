class Addfreeuser < ActiveRecord::Migration
  def change
  	add_column :users, :freeuser, :boolean
  end
end
