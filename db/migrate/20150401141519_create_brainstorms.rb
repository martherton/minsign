class CreateBrainstorms < ActiveRecord::Migration
  def change
    create_table :brainstorms do |t|

      t.timestamps null: false
      
    end
  end
end
