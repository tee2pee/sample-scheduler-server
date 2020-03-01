class Calendar < ApplicationRecord
  has_many :schedules, -> { where(deleted: false) }
  
  validates :title, length: { maximum: 50 }
end
