class CreateImgDocs < ActiveRecord::Migration
  def change
    create_table :img_docs do |t|
      t.binary :img
      t.string :format
      t.references :text
      t.references :span

      t.timestamps
    end
    add_index :img_docs, :text_id
    add_index :img_docs, :span_id
  end
end
