class User < ApplicationRecord
    has_many :parcels
    has_many :recipients, through: :parcels
end
