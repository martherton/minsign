class Addforeignkeydocstruct2 < ActiveRecord::Migration
  def change
  	add_column :docstructures, :draft_id, :integer
  end
end
