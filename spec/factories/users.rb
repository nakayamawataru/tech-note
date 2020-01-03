
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:mail) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "TEST_PASSWORD#{n}"}
  end
end
#データを生成する毎に通し番号をふってユニークな値を作るように