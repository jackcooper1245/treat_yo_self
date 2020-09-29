class Treat < ApplicationRecord
    belongs_to :list
    belongs_to :user
    validates :name, presence: :true
    validates :cost, presence: :true
end