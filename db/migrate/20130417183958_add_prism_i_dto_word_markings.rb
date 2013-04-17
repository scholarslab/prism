class AddPrismIDtoWordMarkings < ActiveRecord::Migration
  def change
  	add_column :word_markings, :prism_id, :integer
  	add_index :word_markings, :prism_id,   	 	:unique => true
  	add_column :facets, :color, :string
  end
end
