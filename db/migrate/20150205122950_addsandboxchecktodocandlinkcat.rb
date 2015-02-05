class Addsandboxchecktodocandlinkcat < ActiveRecord::Migration
  def change
  	add_column :linkcats, :sandbox, :boolean
  	add_column :docstructures, :sandbox, :boolean
  end
end
