class Adddoctofind < ActiveRecord::Migration
  def change
  	add_column :finds, :docstructure_id, :integer
  end
end
