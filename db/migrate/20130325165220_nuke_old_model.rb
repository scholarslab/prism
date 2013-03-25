class NukeOldModel < ActiveRecord::Migration
  def up
      #remove_column :prism, :document_id
      #drop_table :facets
      #drop_table :documents
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
