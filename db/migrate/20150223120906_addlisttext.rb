class Addlisttext < ActiveRecord::Migration
  def change
  	add_column :declaratives, :listtext, :string
  end
end
