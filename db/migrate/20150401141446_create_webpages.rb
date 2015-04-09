class CreateWebpages < ActiveRecord::Migration
  def change
    create_table :webpages do |t|

      t.timestamps null: false
      t.string :urlused
    end
  end
end
