class CreateImgSpans < ActiveRecord::Migration
  def change
    create_table :img_spans do |t|
      t.string :vector
      t.string :session
      t.references :tag
      t.references :doc

      t.timestamps
    end
    add_index :img_spans, :tag_id
    add_index :img_spans, :doc_id
  end
end
