module Types
  class ScheduleType < Types::BaseObject
    field :id, Int, null: false
    field :calendar_id, Int, null: false
    field :fr_datetime, GraphQL::Types::ISO8601DateTime, null: false
    field :to_datetime, GraphQL::Types::ISO8601DateTime, null: false
    field :title, String, null: false
  end
end
