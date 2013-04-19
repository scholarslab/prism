
class AddFacetTable < ActiveRecord::Migration
  def change
   rename_column :facets, :category, :description
   add_column :facets, :order, :integer
  end
end