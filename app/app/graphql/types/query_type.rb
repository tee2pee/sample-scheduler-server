module Types
  class QueryType < Types::BaseObject
    
    field :me, UserType, null: false,
        description: 'ログインユーザー情報取得'
    def me
      context[:current_user]
    end

    field :my_schedules, [ScheduleType], null: false,
        description: 'ログインユーザースケジュール取得' do
      argument :fr, GraphQL::Types::ISO8601DateTime, required: true
      argument :to, GraphQL::Types::ISO8601DateTime, required: true
    end
    def my_schedules(fr:, to:)
      Schedule.where(
        calendar_id: context[:current_user].calendars.map{|e| e.id},
        fr_datetime: DateTime.new(0000, 1, 1, 0, 0, 0,'+0')..to,
        to_datetime: fr..DateTime.new(9999,12,31,23,59,59,'+0'),
        deleted: false
      )
    end

  end
end
