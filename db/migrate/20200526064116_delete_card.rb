class DeleteCard < ActiveRecord::Migration[5.2]
  def change
      remove_reference :cards, :impiegato    
      drop_table :cards
  end
end
