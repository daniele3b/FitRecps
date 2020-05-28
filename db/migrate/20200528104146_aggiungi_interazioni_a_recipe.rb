class AggiungiInterazioniARecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :interazioni, :integer
  end
end
