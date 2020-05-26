class RimouviAllergeni < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :allergeni
  end
end
