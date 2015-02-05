class Addforeignkeydeclarative < ActiveRecord::Migration
  def change
  	add_column :declaratives, :user_id, :integer
  	
  	


  end
end
