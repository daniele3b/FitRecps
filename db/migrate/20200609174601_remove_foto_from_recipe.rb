class RemoveFotoFromRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :foto
  end
end
