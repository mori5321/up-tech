# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    date "2018-10-01"
    start_time "11:00"
    finish_time "11:30"

    factory :weekly_report do
      week "2018W01"
      date nil
      start_time nil
      finish_time nil
    end

    factory :monthly_report do
      month "2018-01"
      date nil
      start_time nil
      finish_time nil
    end
  end
end
