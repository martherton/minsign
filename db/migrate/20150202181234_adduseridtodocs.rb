class Adduseridtodocs < ActiveRecord::Migration
  def change
  	add_column :docstructures, :user_id, :integer
  end
end
