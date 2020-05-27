class Chepalle2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :user_id
    remove_column :reviews, :card_id
  end
end
