class CreateWordMarkings < ActiveRecord::Migration
  def change
    create_table :word_markings do |t|
      t.integer :index
      t.integer :facet1_count, :default => 0
      t.integer :facet2_count, :default => 0
      t.integer :facet3_count, :default => 0
      t.integer :facet4_count, :default => 0
      t.references :prism

      t.timestamps
    end
    add_index :word_markings, :prism_id
  end
end
