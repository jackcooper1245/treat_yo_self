class List < ApplicationRecord
    belongs_to :user
    has_one :budget, through: :user
    accepts_nested_attributes_for :budget
    has_many :lts
    validates :name, presence: :true
    validates :start_time, presence: :true
    validates :number_of_treats, numericality: {less_than_or_equal_to: 7}

  
end
