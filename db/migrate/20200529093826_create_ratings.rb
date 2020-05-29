class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.decimal :valore
      t.string :recipes
      t.string :users

      t.timestamps
    end
  end
end
