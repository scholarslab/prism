class MoreMetaDataToPrismModel < ActiveRecord::Migration
 def change
 	add_column :prisms, :language, :string
  	remove_column :prisms, :prompt
 end
end
