class AddSandboxToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :sandbox, :boolean

  end
end
