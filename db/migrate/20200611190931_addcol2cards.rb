class Addcol2cards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :tutorial, :string 
    add_column :cards, :spiegazione, :string
    add_column :cards, :interazioni, :integer
  end
end
