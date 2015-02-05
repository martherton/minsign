class CreateDeclaratives < ActiveRecord::Migration
  def change
    create_table :declaratives do |t|
    	t.text :urlsource
    	t.text :declarativetext
      t.text :declarativejusttext
    	t.integer :datapoint
    	t.string :units
    	t.text :entryhierarchy
    	t.string :texttype
    	t.boolean :entryend
      t.timestamps null: false
    end
  end
end
