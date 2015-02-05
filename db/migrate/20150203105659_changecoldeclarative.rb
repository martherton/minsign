class Changecoldeclarative < ActiveRecord::Migration
  def change
  	change_column :declaratives, :urlsource, :string
  end
end
