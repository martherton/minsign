class CreateDocstructures < ActiveRecord::Migration
  def change
    create_table :docstructures do |t|
    	t.string :headingname
      t.timestamps null: false
    end
  end
end
