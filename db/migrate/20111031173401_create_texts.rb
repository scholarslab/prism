class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.string :author
      t.date :pub_date
      t.references :tags
      t.references :text_doc
      t.references :img_doc

      t.timestamps
    end
    add_index :texts, :tags_id
    add_index :texts, :text_doc_id
    add_index :texts, :img_doc_id
  end
end
