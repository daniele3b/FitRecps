class ModificaAllergeniLaVendetta < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :allergeni, :string
  end
end
