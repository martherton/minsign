class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|

      t.timestamps null: false
      t.string :sourcetype
      t.text :draftnotes
      t.string :topic
      t.boolean :currentissue
      
    end
  end
end
