module Types
  class CalendarType < Types::BaseObject
    field :id, Int, null: false
    field :title, String, null: false
    field :schedules, [ScheduleType], null: true
  end
end
