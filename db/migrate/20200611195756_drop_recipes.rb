class DropRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :recipes, column: :user_id
    drop_table :recipes
  end
end
