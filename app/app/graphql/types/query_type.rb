module Types
  class QueryType < Types::BaseObject
    field :my_schedules, [CalendarType], null: false
    def my_schedules
      context[:current_user].calendars.all
    end
  end
end
