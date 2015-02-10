class Nullandfalsebooleans3 < ActiveRecord::Migration
  def change
  	change_column_null :declaratives, :endsection, false, 0
  	change_column_null :declaratives, :sandbox, false, 0
  	change_column_null :docstructures, :sandbox, false, 0
  	change_column_null :docstructures, :released, false, 0
  	change_column_null :docstructures, :liveissue, false, 0
  	change_column_null :linkcats, :sandbox, false, 0
  	change_column_null :linkcats, :released, false, 0


  end
end
