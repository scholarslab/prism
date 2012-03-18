class AddReferencesToMarkings < ActiveRecord::Migration
  def change
    change_table :markings do |t|
      t.references :document
      t.references :user
    end
  end
end
