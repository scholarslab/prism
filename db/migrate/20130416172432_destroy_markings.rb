class DestroyMarkings < ActiveRecord::Migration
  def change
  	drop_table :markings
  	add_column :word_markings, :user_id, :integer
  	add_column :word_markings, :facet_id, :integer
  	remove_column :word_markings, :prism_id
  	remove_column :word_markings, :facet1_count
  	remove_column :word_markings, :facet2_count
  	remove_column :word_markings, :facet3_count
  	remove_column :word_markings, :facet4_count
  	remove_column :prisms, :facet1
  	remove_column :prisms, :facet2
  	remove_column :prisms, :facet3
  	remove_column :prisms, :facet4
  end
end