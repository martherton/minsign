class CreateMoreinfos < ActiveRecord::Migration
  def change
    create_table :moreinfos do |t|
    	t.string :email
      t.timestamps null: false
    end
  end
end
