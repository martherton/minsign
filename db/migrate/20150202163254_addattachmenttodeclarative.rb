class Addattachmenttodeclarative < ActiveRecord::Migration
  def change
  	add_attachment :declaratives, :declarativeimage
  end
end
