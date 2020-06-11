class Rating < ApplicationRecord
    validates :valore,  presence: true
    belongs_to :user
    belongs_to :recipe
end
