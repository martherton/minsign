class Addcolumntodeclarative < ActiveRecord::Migration
  def change
  	add_column :declaratives, :endsection, :boolean
  end
end
