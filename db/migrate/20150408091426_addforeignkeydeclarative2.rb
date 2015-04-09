class Addforeignkeydeclarative2 < ActiveRecord::Migration
  def change
  	add_column :declaratives, :draft_id, :integer
  end
end
