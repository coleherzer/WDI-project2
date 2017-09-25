class User < ApplicationRecord
    has_secure_password
    has_many :exercises
    has_many :diets
    has_many :goals
    validates :email, :name, presence: true
    validates :email, uniqueness: true
end
