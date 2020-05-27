class Card < ApplicationRecord
  self.primary_key = 'idf'
  mount_uploader :spiegazione, SpiegazioneUploader
  belongs_to :user
end
