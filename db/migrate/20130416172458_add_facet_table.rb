
class AddFacetTable < ActiveRecord::Migration
  def change
    create_table :facets do |t|
    t.string :description
    t.integer :prism_id
    t.integer :order
  end
  end
end