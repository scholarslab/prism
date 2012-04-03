class AddNumWords < ActiveRecord::Migration
  def change
      change_table :documents do |t|
          t.integer :num_words
      end
  end
end
