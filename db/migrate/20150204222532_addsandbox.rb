class Addsandbox < ActiveRecord::Migration
  def change
  	add_column :declaratives, :sandbox, :boolean
  end
end
