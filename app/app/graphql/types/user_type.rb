module Types
  class UserType < Types::BaseObject
    field :id, Int, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :calendars, [Types::CalendarType], null: true
  end
end
