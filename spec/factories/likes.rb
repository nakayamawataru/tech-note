
FactoryBot.define do
  factory :like do
    sequence(:user_id) { |n| "TEST_USER_ID#{n}"}
    sequence(:post_id) { |n| "TEST_POST_ID#{n}"}
  end
end