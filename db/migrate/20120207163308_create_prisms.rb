class CreatePrisms < ActiveRecord::Migration
  def change
    create_table :prisms do |t|
      t.text :prompt

      t.timestamps
    end
  end
end
