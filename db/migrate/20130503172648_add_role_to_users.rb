class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => 'user'
    User.update_all :role => 'user'
  end
end
