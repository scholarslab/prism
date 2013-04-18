class NukeOldModel < ActiveRecord::Migration
  def up
      remove_column :prisms, :document_id
      drop_table :facets
      drop_table :documents
      remove_column :prisms, :sandbox
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
