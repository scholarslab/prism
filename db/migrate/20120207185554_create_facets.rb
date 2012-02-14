class CreateFacets < ActiveRecord::Migration
  def change
    create_table :facets do |t|
      t.string :color
      t.string :category

      t.timestamps
    end
  end
end
