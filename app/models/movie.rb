class Movie < ApplicationRecord
    validates :name, uniqueness: true 
    has_many :schedules, dependent: :restrict_with_error
end
