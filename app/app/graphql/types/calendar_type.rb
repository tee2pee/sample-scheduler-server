module Types
  class CalendarType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :schedules, [ScheduleType], null: true
  end
end
