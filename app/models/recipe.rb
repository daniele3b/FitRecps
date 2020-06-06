class Recipe < ApplicationRecord
  self.primary_key = 'codice'
  mount_uploader :foto, FotoUploader
  validates :nome,:ingredienti,:tipo,:proteine,:grassi,:carboidrati,:energia,  presence: true
  belongs_to :user
end
