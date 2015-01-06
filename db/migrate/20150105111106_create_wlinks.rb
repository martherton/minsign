class CreateWlinks < ActiveRecord::Migration
  def change
    create_table :wlinks do |t|
    	t.string :wlinkname
    	t.string :wlinkurl
    	t.string :wlinkdesc
    	t.string :wlinkveri
    	t.references :wlinklog, :polymorphic => true
      t.timestamps null: false
    end
  end
end
