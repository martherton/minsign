class Extradeclarativeinfo < ActiveRecord::Migration
  def change
  	add_column :declaratives, :listtitle, :string
  	add_column :declaratives, :reviewdate, :date
  end
end
