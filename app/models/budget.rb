class Budget < ApplicationRecord
    belongs_to :user
    has_many :lists, through: :user
    has_many :treats, through: :lists
    
end
