class Addcolumndeclarativesextraurl < ActiveRecord::Migration
  def change
  	add_column :declaratives, :urlextra, :string

  end
end
