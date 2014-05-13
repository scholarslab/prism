class AddIndexesToWordMarkings < ActiveRecord::Migration
  def change
    add_index :word_markings, :user_id
    add_index :word_markings, :facet_id
    add_index :word_markings, :prism_id
  end
end
