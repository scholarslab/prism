class CreateTextSpans < ActiveRecord::Migration
  def change
    create_table :text_spans do |t|
      t.integer :start
      t.integer :length
      t.string :session
      t.references :tag
      t.references :doc

      t.timestamps
    end
    add_index :text_spans, :tag_id
    add_index :text_spans, :doc_id
  end
end
