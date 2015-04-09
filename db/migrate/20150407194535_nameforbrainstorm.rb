class Nameforbrainstorm < ActiveRecord::Migration
  def change
  	add_column :brainstorms, :name, :string
  end
end
