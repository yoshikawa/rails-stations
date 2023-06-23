class Reservation < ApplicationRecord
    validates :name,presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, uniqueness:true,presence: true,format: { with: VALID_EMAIL_REGEX }
    validates :sheet_id,uniqueness:true,presence: true
    validates :schedule_id,presence: true
    validates :date,presence: true
  
    belongs_to :sheet, optional: true
    belongs_to :schedule
end