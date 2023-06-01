class Schedule < ApplicationRecord
    belongs_to :movie, primary_key: :id, foreign_key: :movie_id
    has_many :reservations, dependent: :restrict_with_error
end