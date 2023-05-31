class Schedule < ApplicationRecord
    belongs_to :movie, primary_key: :id, foreign_key: :movie_id
end