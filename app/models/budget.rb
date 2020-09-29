class Budget < ApplicationRecord
    belongs_to :user
    has_many :lists, through: :user
    has_many :treats, through: :lists
    validates :name, presence: :true
    validates :total, presence: :true
    validates :currency, presence: :true
end