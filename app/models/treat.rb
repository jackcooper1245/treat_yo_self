class Treat < ApplicationRecord
    belongs_to :user
    has_many :lists
    validates :name, presence: :true
    validates :cost, presence: :true

    def self.treats_finder(name)
        Treat.where('name LIKE ?', "%#{name}%")
    end

end
