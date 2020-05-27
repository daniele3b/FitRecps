class CambiaAllergeni < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :arachidi_e_derivati, :string
    change_column :recipes, :frutta_a_guscio, :string
    change_column :recipes, :latte_e_derivati, :string
    change_column :recipes, :molluschi, :string
    change_column :recipes, :pesce, :string
    change_column :recipes, :sesamo, :string
    change_column :recipes, :soia, :string
    change_column :recipes, :crostacei, :string
    change_column :recipes, :glutine, :string
    change_column :recipes, :lupini, :string
    change_column :recipes, :senape, :string
    change_column :recipes, :sedano, :string
    change_column :recipes, :anidride_solforosa_e_solfiti, :string
    change_column :recipes, :uova_e_derivati, :string

  end
end
