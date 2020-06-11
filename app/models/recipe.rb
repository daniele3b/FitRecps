class Recipe < ApplicationRecord
  mount_uploader :foto, FotoUploader
  validates :nome,:ingredienti,:tipo,:proteine,:grassi,:carboidrati,:energia,  presence: true
  belongs_to :user
  has_many :ratings,dependent: :delete_all
end
