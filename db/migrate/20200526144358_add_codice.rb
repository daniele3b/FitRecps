class AddCodice < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :codice
  end
end
