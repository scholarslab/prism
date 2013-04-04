class MigrateMarkingsToNewModel < ActiveRecord::Migration
  def change
  	add_column	:users, :facet_num, :integer
  end
end
