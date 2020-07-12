FactoryBot.define do
  factory :user do
    nickname              {"hoge"}
    email                 {"hoge@email.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
  end
end