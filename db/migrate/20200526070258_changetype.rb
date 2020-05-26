class Changetype < ActiveRecord::Migration[5.2]
  def cahnge
      change_table :cards do |t|
      t.references :user,type: :string, foreign_key: true
    end
  end
end
