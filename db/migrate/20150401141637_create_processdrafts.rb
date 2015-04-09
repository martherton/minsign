class CreateProcessdrafts < ActiveRecord::Migration
  def change
    create_table :processdrafts do |t|

      t.timestamps null: false
    end
  end
end
