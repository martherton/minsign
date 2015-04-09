class Addlinkcatiddraft < ActiveRecord::Migration
  def change
  	add_column :drafts, :linkcat_id, :integer
  end
end
