class Calendar < ApplicationRecord
  has_many :schedules, -> { where(deleted: false) }, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 50 }
end
