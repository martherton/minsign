class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|

      t.timestamps null: false
      t.string :lecturer
      t.string :lecturetitle
      t.date :lecturedate
    end
  end
end
