class User < ApplicationRecord
    has_secure_password
    has_many :lists
    has_many :budgets
    has_many :treats, through: :lists
    validates :user_name, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :age, presence: true
    validates :password, length: { in: 6..20 }
end
