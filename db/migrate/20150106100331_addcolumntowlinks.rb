class Addcolumntowlinks < ActiveRecord::Migration
  def change
  	add_column :wlinks, :source, :string
  	add_column :wlinks, :year, :integer
  end
end
