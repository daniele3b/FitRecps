class AggiungiAllergeni < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :arachidi_e_derivati, :boolean, default: false
    add_column :recipes, :frutta_a_guscio, :boolean, default: false
    add_column :recipes, :latte_e_derivati, :boolean, default: false
    add_column :recipes, :molluschi, :boolean, default: false
    add_column :recipes, :pesce, :boolean, default: false
    add_column :recipes, :sesamo, :boolean, default: false
    add_column :recipes, :soia, :boolean, default: false
    add_column :recipes, :crostacei, :boolean, default: false
    add_column :recipes, :glutine, :boolean, default: false
    add_column :recipes, :lupini, :boolean, default: false
    add_column :recipes, :senape, :boolean, default: false
    add_column :recipes, :sedano, :boolean, default: false
    add_column :recipes, :anidride_solforosa_e_solfiti, :boolean, default: false
    add_column :recipes, :uova_e_derivati, :boolean, default: false
  end
end
