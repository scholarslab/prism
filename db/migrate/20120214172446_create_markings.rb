class CreateMarkings < ActiveRecord::Migration
  def change
    create_table :markings do |t|
      t.integer :start_pos
      t.integer :end_pos

      t.timestamps
    end
  end
end
