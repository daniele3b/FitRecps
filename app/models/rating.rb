class Rating < ApplicationRecord
    validates :valore,:users,:recipes,  presence: true
end
