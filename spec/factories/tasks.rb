FactoryGirl.define do
  factory :task do
    association :user
    title "サンプル"
    kind 0
    date "2018-10-01"
    start_time "10:00"
    finish_time "10:30"
  end
end