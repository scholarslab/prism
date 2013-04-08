class AddMetaDatatoPrismModel < ActiveRecord::Migration
  def change
  	add_column :prisms, :user_id, :integer
  	add_column :prisms, :unlisted, :boolean
  	add_column :prisms, :publication_date, :integer
  end
end
