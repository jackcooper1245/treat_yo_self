class List < ApplicationRecord
    belongs_to :user
    has_one :budget, through: :user
    has_many :treats
    validates :name, presence: :true
    validates :start_time, presence: :true
    validates :end_time, presence: :true
    validates :number_of_treats, numericality: {less_than_or_equal_to: 7}

    def end_must_be_after_start(list)
        if list.start_time >= list.end_time
          errors.add(:end_time, "must be after start time")
        end
      end
end
