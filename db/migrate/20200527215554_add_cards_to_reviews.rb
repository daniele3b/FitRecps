class AddCardsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :cards, :string
  end
end
