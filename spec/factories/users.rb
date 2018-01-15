FactoryGirl.define do
  factory :user do
    name "taro"
    email "morisamp@hoge.com"
    password "password"
    password_confirmation "password"
    salt "salt"
    role 0
    superior_id nil
  end
end