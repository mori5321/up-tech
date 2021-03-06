FactoryGirl.define do
  factory :task do
    association :user
    title "サンプル"
    kind 0
    date "2018-10-01"
    start_time "10:00"
    finish_time "10:30"

    factory :weekly_task do
      kind 1
      week "2018W01"
      date nil
      start_time nil
      finish_time nil
    end

    factory :monthly_task do
      kind 2
      month "2018-01"
      date nil
      start_time nil
      finish_time nil
    end
  end
end