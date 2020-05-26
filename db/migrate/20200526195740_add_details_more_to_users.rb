class AddDetailsMoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cognome, :string
    add_column :users, :luogoNascita, :string
    add_column :users, :dataNascita, :string
    add_column :users, :sesso, :string
  end
end
