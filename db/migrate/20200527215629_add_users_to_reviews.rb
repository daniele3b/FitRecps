class AddUsersToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :users, :string
  end
end
