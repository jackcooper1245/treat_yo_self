class List < ApplicationRecord
    belongs_to :user
    has_one :budget, through: :user
    accepts_nested_attributes_for :budget
    has_many :lts
    validates :name, presence: :true
    validates :start_time, presence: :true
    validates :number_of_treats, numericality: {less_than_or_equal_to: 7}


    def add_treat
        @list = List.find_by(id: params[:list_id])
        @treat = Treat.find_by(id: params[:treat_id])
        @list.treats << @treat
        @treat.lists << @list
        @treat.save
        @list.save
    end
  
    def select_treat
        @treat = Treat.find_by(id: params[:treat_id])
        @list = List.find_by(id: params[:list_id])
        @list.budget.total = (@list.budget.total - @treat.cost)
    end
end
