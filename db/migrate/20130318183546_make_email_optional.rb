class MakeEmailOptional < ActiveRecord::Migration
  
  def up
  	change_column(:users, :email, :string, :null => true, :default => nil)
  end

  def down
  	change_column(:users, :email, :string, :null => false, :default => "")
  end

end
