class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|

      t.timestamps null: false
      t.string :meetingwith
      t.string :meetingtopic
    end
  end
end
