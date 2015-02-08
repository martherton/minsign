class Addliveissuebooleantoheading < ActiveRecord::Migration
  def change
  	add_column :docstructures, :liveissue, :boolean
  end
end
