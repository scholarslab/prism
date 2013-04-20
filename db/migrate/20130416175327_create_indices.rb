class CreateIndices < ActiveRecord::Migration
  def change
  	   add_index :prisms, :uuid,                :unique => true
  	   add_index :prisms, :user_id
  	   add_index :word_markings, :index
  end
end
