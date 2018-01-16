FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    role 0
    superior_id nil

    factory :guest do
      role 0
    end

    factory :manager do
      role 1
    end

    factory :admin do
      role 2
    end
  end
end