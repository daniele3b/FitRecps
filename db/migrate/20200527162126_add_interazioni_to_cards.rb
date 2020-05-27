class AddInterazioniToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :interazioni, :integer
  end
end
