class Card < ApplicationRecord
  self.primary_key = 'idf'
  mount_uploader :spiegazione, SpiegazioneUploader
  validates :esercizi,:durata,:tutorial,:categoria,:zona,:energia,  presence: true
  belongs_to :user
end
