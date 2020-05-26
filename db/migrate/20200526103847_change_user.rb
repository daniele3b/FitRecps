class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :user_id, :string
  end
end
