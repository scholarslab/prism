class AddDetailsToPrisms < ActiveRecord::Migration
  def change
    add_column :prisms, :title, :string
    add_column :prisms, :author, :string
    add_column :prisms, :content, :text
    add_column :prisms, :sandbox, :boolean
    add_column :prisms, :num_words, :integer
    add_column :prisms, :facet1, :string
    add_column :prisms, :facet2, :string
    add_column :prisms, :facet3, :string
    add_column :prisms, :facet4, :string
  end
end
