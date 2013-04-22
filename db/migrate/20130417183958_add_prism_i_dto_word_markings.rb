class AddPrismIDtoWordMarkings < ActiveRecord::Migration
  def change
  	add_column :word_markings, :prism_id, :integer
  end
end
