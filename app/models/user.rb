class User < ApplicationRecord
    has_secure_password
    has_many :lists
    has_one :budget
    has_many :treats
    has_many :lts, through: :lists
    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :age, presence: true
    validates :password, length: { in: 6..20 }
    accepts_nested_attributes_for :budget
end
