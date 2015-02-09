class Findtaglist < ActiveRecord::Migration
  def change
  	add_column :finds, :tag_list_tokens, :string
  end
end
