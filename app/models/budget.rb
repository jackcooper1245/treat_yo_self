class Budget < ApplicationRecord
    belongs_to :user
    has_many :lists, through: :user
    has_many :treats, through: :lists
    validates :currency, presence: :true
    validates :total, :allow_nil => true, numericality: { greater_than: 0}
end
