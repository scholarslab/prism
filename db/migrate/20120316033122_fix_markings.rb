class FixMarkings < ActiveRecord::Migration
  def change
    change_table :markings do |t|
      t.text :word_array
      t.remove :start_pos
      t.remove :end_pos
    end
  end
end
