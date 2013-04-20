class FixFacetRelationships < ActiveRecord::Migration
  def change
    remove_column :facets, :prism_id
    add_column :facets, :prism_id, :string, :limit => 36
    add_index :word_markings, [:prism_id, :index]
  end
end
