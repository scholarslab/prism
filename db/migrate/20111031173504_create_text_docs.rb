class CreateTextDocs < ActiveRecord::Migration
  def change
    create_table :text_docs do |t|
      t.string :markup
      t.string :format
      t.references :text
      t.references :span

      t.timestamps
    end
    add_index :text_docs, :text_id
    add_index :text_docs, :span_id
  end
end
