class AddFacetNumtoMarking < ActiveRecord::Migration
  def change
	  add_column :markings, :facet_num, :integer
  end
end
