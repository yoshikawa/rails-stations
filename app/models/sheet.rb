class Sheet < ApplicationRecord
  has_many :reservation
  has_many :screen
end
