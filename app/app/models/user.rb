class User < ApplicationRecord
  has_many :relationships, -> { where(deleted: false) }, dependent: :destroy
  has_many :calendars, -> { where(deleted: false) }, through: :relationships

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.from_token_request request
    email = request.params["auth"] && request.params["auth"]["email"]
    self.find_by email: email, deleted: false
  end
end
