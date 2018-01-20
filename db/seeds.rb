10.times do |num|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  superior_id = nil
  user = User.create(
    email: email,
    name: name,
    role: num % 3,
    superior_id: nil,
    password: 'password',
    password_confirmation: 'password'
  )

  1000.times do |num_for_task|
    title = Faker::Cat.name
    kind = num_for_task % 3
    date = Faker::Date.between(Date.today, 2.day.from_now)
    start_time = "10:00"
    finish_time = "11:00"
    month = "2018-01"
    week = "2018-W01"
    task = Task.create(
      title: title,
      kind: kind,
      date: date,
      start_time: start_time,
      finish_time: finish_time,
      month: month,
      week: week,
      user_id: user.id)

    Report.create(
      task_id: task.id,
      date: date,
      start_time: start_time,
      finish_time: finish_time,
      month: month,
      week: week)
  end
end