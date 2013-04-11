class MergeDocumentToPrism < ActiveRecord::Migration
  def up
    execute "
      INSERT INTO prisms(title, author, created_at, updated_at, num_words, description)
        SELECT title, author, created_at, updated_at, num_words, description
        FROM documents"
  end

  def down
  end
end
