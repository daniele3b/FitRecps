class AddSpiegazioneToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :spiegazione, :string
  end
end
