class FixAssociations < ActiveRecord::Migration
  def change
    change_table :prisms do |t|
      t.integer :document_id
    end
    change_table :markings do |t|
      t.integer :facet_id
      t.integer :prism_id
      t.remove :document_id
    end
  end
end
