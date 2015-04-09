class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

      t.timestamps null: false
      t.string :author
      t.string :title
      t.string :ISBN
      t.string :goodreads
      
    end
  end
end
