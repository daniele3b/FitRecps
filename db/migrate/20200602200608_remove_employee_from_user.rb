class RemoveEmployeeFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :employee, :boolean
  end
end
