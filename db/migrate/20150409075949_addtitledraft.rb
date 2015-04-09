class Addtitledraft < ActiveRecord::Migration
  def change
  	add_column :drafts, :title, :string
  end
end
