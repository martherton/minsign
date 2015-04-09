class Addforeignkeys < ActiveRecord::Migration
  def change
  	add_column :drafts, :user_id, :integer
  	add_column :webpages, :draft_id, :integer
  	add_column :brainstorms, :draft_id, :integer
  	add_column :meetings, :draft_id, :integer
  	add_column :books, :draft_id, :integer
  	add_column :lectures, :draft_id, :integer
  	add_column :otherpublications, :draft_id, :integer
  	add_column :images, :draft_id, :integer







  end
end
