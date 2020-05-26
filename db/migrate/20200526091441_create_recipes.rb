class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :nome
      t.string :tipo
      t.string :video_tutorial
      t.float :energia
      t.float :carboidrati
      t.float :proteine
      t.float :fibre
      t.float :sodio
      t.float :grassi
      t.text :ingredienti
      t.string :foto
      t.string :allergeni
      t.text :procedimento
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
