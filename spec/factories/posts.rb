FactoryBot.define do
  factory :post do
    title              {"タイトル"}
    text               {"本文テスト"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end