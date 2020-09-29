class List < ApplicationRecord
    belongs_to :user
    has_one :budget, through: :user
    has_many :treats
    validates :name, presence: :true
    validates :week, presence: :true
end
