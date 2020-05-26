class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards ,{:id => false , :primary_key => :idf} do |t|
      t.string :idf
      t.string :durata
      t.string :categoria
      t.string :zona
      t.integer :energia
      t.text :esercizi
      t.references :user,type: :string, foreign_key: true

      t.timestamps
    end
  end
  
end
