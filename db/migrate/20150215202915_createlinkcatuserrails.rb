class Createlinkcatuserrails < ActiveRecord::Migration
  def change
  	create_table :linkcats_users, id: false do |t|
      t.integer :user_id, index: true
      t.integer :linkcat_id, index: true
    end
  end
end
