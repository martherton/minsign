class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|

      t.timestamps null: false
      t.boolean :approved
    end
  end
end
