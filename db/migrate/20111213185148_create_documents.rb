class CreateDocuments < ActiveRecord::Migration
  def change
    say_with_time "Creating documents table..." do
      create_table :documents do |t|
        t.string :title
        t.string :author
        t.integer :pub_date
        t.text :description
        t.string :format
        t.text :content

        t.timestamps
      end

      add_index :documents, :title
    end
  end
end
