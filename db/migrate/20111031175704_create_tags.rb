class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :color
      t.string :name
      t.references :text
      t.references :img_spans
      t.references :text_spans

      t.timestamps
    end
    add_index :tags, :text_id
    add_index :tags, :img_spans_id
    add_index :tags, :text_spans_id
  end
end
