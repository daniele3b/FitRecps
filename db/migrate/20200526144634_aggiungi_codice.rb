class AggiungiCodice < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :codice, :string
  end
end
