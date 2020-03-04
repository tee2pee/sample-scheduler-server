# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usr = User.create(
  name: 'Test User',
  email: 'test@example.com',
  password: 'passw0rd',
  password_confirmation: 'passw0rd',
  deleted: false
)
usr_deleted = User.create(
  name: 'Deleted User',
  email: 'deleted@example.com',
  password: 'passw0rd',
  password_confirmation: 'passw0rd',
  deleted: true
)

cal = Calendar.create(
  title: 'Test Calendar',
  deleted: false
)
cal_deleted1 = Calendar.create(
  title: 'Relation Deleted1 Calendar',
  deleted: false
)
cal_deleted2 = Calendar.create(
  title: 'Deleted2 Calendar',
  deleted: true
)

Schedule.create(
  calendar_id: cal.id,
  fr_datetime: DateTime.new(2020,3,1,12,0,0,'+9'),
  to_datetime: DateTime.new(2020,3,1,18,0,0,'+9'),
  title: 'Test Schedule1',
  deleted: false
)
Schedule.create(
  calendar_id: cal.id,
  fr_datetime: DateTime.new(2020,3,10,12,0,0,'+9'),
  to_datetime: DateTime.new(2020,3,10,18,0,0,'+9'),
  title: 'Test Schedule2',
  deleted: false
)
Schedule.create(
  calendar_id: cal.id,
  fr_datetime: DateTime.new(2020,3,20,12,0,0,'+9'),
  to_datetime: DateTime.new(2020,3,20,18,0,0,'+9'),
  title: 'Test Schedule3',
  deleted: false
)
Schedule.create(
  calendar_id: cal.id,
  fr_datetime: DateTime.new(2020,3,30,12,0,0,'+9'),
  to_datetime: DateTime.new(2020,3,30,18,0,0,'+9'),
  title: 'Deleted Schedule',
  deleted: true
)


Relationship.create(
  user_id: usr.id,
  calendar_id: cal.id,
  deleted: false
)
Relationship.create(
  user_id: usr.id,
  calendar_id: cal_deleted1.id,
  deleted: true
)
Relationship.create(
  user_id: usr.id,
  calendar_id: cal_deleted2.id,
  deleted: false
)