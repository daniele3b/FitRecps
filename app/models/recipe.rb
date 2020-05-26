class Recipe < ApplicationRecord
  self.primary_key = 'codice'
  belongs_to :user
end
