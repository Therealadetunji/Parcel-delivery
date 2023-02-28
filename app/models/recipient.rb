class Recipient < ApplicationRecord
    has_many :parcels
    has_many :users, through: :parcels
end
