class AddFotoToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :foto, :string
  end
end
