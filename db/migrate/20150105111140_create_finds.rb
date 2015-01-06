class CreateFinds < ActiveRecord::Migration
  def change
    create_table :finds do |t|
    	t.string :searchterm
    	t.references :activitylog, :polymorphic => true
      t.timestamps null: false
    end
  end
end
