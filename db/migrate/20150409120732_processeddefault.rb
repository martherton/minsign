class Processeddefault < ActiveRecord::Migration
  def change
  	change_column :drafts, :processed, :boolean, :default => false
  end
end
