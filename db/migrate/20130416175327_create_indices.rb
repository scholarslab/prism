class CreateIndices < ActiveRecord::Migration
  def change
  	   add_index :facets, :order,               :unique => true
  	   add_index :prisms, :uuid,                :unique => true
  	   add_index :prisms, :user_id,             :unique => true
  	   add_index :word_markings, :index,   	 	:unique => true
  end
end
