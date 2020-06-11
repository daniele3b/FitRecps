class Createreview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.decimal :valore
      t.references :card,type: :string, foreign_key: true 
      t.references :user, type: :string, foreign_key: true

      t.timestamps
  end
end
end
