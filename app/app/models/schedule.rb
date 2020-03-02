class Schedule < ApplicationRecord
  belongs_to :calendar
  
  validates :calendar_id, presence: true
  validates :fr_datetime, presence: true
  validates :to_datetime, presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
