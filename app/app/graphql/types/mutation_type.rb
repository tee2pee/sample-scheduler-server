module Types
  class MutationType < Types::BaseObject

    class ScheduleData < Types::BaseInputObject
      argument :fr_datetime, GraphQL::Types::ISO8601DateTime, required: true
      argument :to_datetime, GraphQL::Types::ISO8601DateTime, required: true
      argument :title, String, required: true
      argument :description, String, required: false
    end

    field :create_schedule, ScheduleType, null: false,
        description: 'スケジュール登録' do
      argument :calendar_id, Int, required: true
      argument :schedule, ScheduleData, required: true
    end
    def create_schedule(calendar_id:, schedule:)
      context[:current_user].calendars.find(calendar_id).schedules.create!(
        fr_datetime: schedule&.[](:fr_datetime),
        to_datetime: schedule&.[](:to_datetime),
        title: schedule&.[](:title),
        description: schedule&.[](:description),
        deleted: false
      )
    end

    field :modify_schedule, ScheduleType, null: false,
        description: 'スケジュール更新' do
      argument :calendar_id, Int, required: true
      argument :schedule_id, Int, required: true
      argument :schedule, ScheduleData, required: true
    end
    def modify_schedule(calendar_id:, schedule_id:, schedule:)
      s = context[:current_user].calendars.find(calendar_id).schedules.find(schedule_id)
      s.update!(
        fr_datetime: schedule&.[](:fr_datetime),
        to_datetime: schedule&.[](:to_datetime),
        title: schedule&.[](:title),
        description: schedule&.[](:description)
      )
      s
    end

    field :delete_schedule, ScheduleType, null: false,
        description: 'スケジュール削除' do
      argument :calendar_id, Int, required: true
      argument :schedule_id, Int, required: true
    end
    def delete_schedule(calendar_id:, schedule_id:)
      s = context[:current_user].calendars.find(calendar_id).schedules.find(schedule_id)
      s.destroy!
      s
    end

  end
end
