class AddDescriptionToPrisms < ActiveRecord::Migration
  def change
    add_column :prisms, :description, :string
  end
end
