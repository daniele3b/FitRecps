class Card < ApplicationRecord
  self.primary_key = 'idf'
  belongs_to :user
end
