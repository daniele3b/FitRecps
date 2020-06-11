class DropCards < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :cards, column: :user_id
    drop_table :cards
  end
end
