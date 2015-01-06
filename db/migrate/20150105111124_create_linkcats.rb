class CreateLinkcats < ActiveRecord::Migration
  def change
    create_table :linkcats do |t|
    	t.string   :linkcatname
    	t.string :linkcattype
    	t.text   :linkcatdesc
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
