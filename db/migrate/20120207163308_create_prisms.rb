class CreatePrisms < ActiveRecord::Migration
  def change

    create_table :prisms, :id => false do |t|
  	t.string :uuid, :limit => 36, :primary => true
	t.text :prompt

    t.timestamps
	end
  
  end
end
