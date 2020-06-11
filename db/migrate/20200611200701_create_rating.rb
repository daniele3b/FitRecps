class CreateRating < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
        t.decimal :valore
        t.references :recipe,type: :string, foreign_key: true 
        t.references :user, type: :string, foreign_key: true
  
        t.timestamps
    end
  end
end
