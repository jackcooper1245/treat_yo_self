class Budget < ApplicationRecord
    belongs_to :user
    has_many :lists, through: :user
    has_many :treats, through: :lists
    validates :currency, presence: :true
    validates :total, presence: :true
    validates :total, numericality: { greater_than: 0}
end
