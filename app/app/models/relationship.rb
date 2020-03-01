class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :calendar

  validates :user_id, presence: true
  validates :calendar_id, presence: true
end
