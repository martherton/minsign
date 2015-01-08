class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :contentcom
    	t.integer :user_id
    	t.string :email
      t.timestamps null: false
    end
  end
end
