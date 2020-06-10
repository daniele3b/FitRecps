class RemoveProvideFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :provide
  end
end
