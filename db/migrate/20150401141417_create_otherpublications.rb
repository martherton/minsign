class CreateOtherpublications < ActiveRecord::Migration
  def change
    create_table :otherpublications do |t|

      t.timestamps null: false
      t.string :publicationtitle
      t.string :article
    end
  end
end
