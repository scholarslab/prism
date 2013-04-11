class MergeDocumentToPrism < ActiveRecord::Migration
  def up
    say "Copying Documents table data to the Prisms table"
    execute "
      INSERT INTO prisms(title, author, content, created_at, updated_at, num_words, description)
        SELECT title, author, content, created_at, updated_at, num_words, description
        FROM documents"

    say "Cleaning up the documents table by removing the columns"
    #remove_column :documents, :title
    #remove_column :documents, :author
    #remove_column :documents, :content
    #remove_column :documents, :created_at
    #remove_column :documents, :updated_at
    #remove_column :documents, :num_words
    #remove_column :documents, :description
  end

  def down
    #add_column :prisms, :title, :string
    #add_column :prisms, :author, :string
    #add_column :prisms, :content, :text
    #add_column :prisms, :created_at, :datetime
    #add_column :prisms, :updated_at, :datetime
    #add_column :prisms, :num_words, :integer
    #add_column :prisms, :description, :text

    # TODO: need the reverse...is there a schema for handling the document_id and prism_id?

    #remove_column :prims, :title
    #remove_column :prims, :author
    #remove_column :prims, :content
    #remove_column :prims, :created_at
    #remove_column :prims, :updated_at
    #remove_column :prims, :num_words
    #remove_column :prims, :description
  end
end
