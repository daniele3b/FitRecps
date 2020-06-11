class MigrationName < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :reviews, :cards
  end
end
