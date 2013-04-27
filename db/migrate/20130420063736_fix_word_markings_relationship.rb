class FixWordMarkingsRelationship < ActiveRecord::Migration
  def change
    remove_column :word_markings, :prism_id
    add_column :word_markings, :prism_id, :string, :limit => 36
    add_index :facets, [:prism_id,:order],               :unique => true
  end
end