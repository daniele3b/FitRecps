class ChangeRec < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :user_id, :string
    add_column :recipes, :codice, :string
    remove_column :recipes, :allergeni
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
    add_column :recipes, :interazioni, :integer
  end
end
