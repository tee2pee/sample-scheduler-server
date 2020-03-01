class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :deleted

      t.timestamps
    end
    create_table :calendars do |t|
      t.string :title
      t.boolean :deleted

      t.timestamps
    end
    create_table :schedules do |t|
      t.belongs_to :calendar
      t.datetime :fr_datetime
      t.datetime :to_datetime
      t.string :title
      t.text :description
      t.boolean :deleted

      t.timestamps
    end
    create_table :relationships do |t|
      t.belongs_to :user
      t.belongs_to :calendar
      t.boolean :deleted

      t.timestamps
    end
  end
end
