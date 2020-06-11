class Card < ApplicationRecord
  mount_uploader :spiegazione, SpiegazioneUploader
  validates :esercizi,:durata,:tutorial,:categoria,:zona,:energia,  presence: true
  belongs_to :user
  has_many :reviews,dependent: :delete_all
end
