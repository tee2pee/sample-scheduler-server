module Types
  class ScheduleType < Types::BaseObject
    field :id, ID, null: false
    field :fr_datetime, GraphQL::Types::ISO8601DateTime, null: true
    field :to_datetime, GraphQL::Types::ISO8601DateTime, null: true
    field :title, String, null: true
    field :description, String, null: true
  end
end
