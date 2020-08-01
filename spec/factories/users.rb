FactoryBot.define do
  factory :user do
    nickname              { "AbeChan" }
    password              { "8888888" }
    password_confirmation { "8888888" }
    sequence(:email) { Faker::Internet.email }
  end
end
