class AddCfToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cf, :string
  end
end
