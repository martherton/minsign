class Adddatemeeting < ActiveRecord::Migration
  def change
  	add_column :meetings, :meetingdate, :date
  end
end
