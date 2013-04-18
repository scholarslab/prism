class AddLicenseToPrisms < ActiveRecord::Migration
  def change
    add_column :prisms, :license, :string

    Prism.update_all ["license = ?", 'CC0']
  end
end
