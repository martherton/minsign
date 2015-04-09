class Addprocesseddraft2 < ActiveRecord::Migration
  def change
  	add_column :drafts, :processed, :boolean
  end
end
