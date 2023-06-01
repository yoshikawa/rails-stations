class Reservation < ApplicationRecord
    belongs_to :schedule, primary_key: :id, foreign_key: :schedule_id
    belongs_to :sheet, primary_key: :id, foreign_key: :sheet_id
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :schedule_id, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :name, presence: true
    validates :sheet_id, presence: true
    validates :date, presence: true
end