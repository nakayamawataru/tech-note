
FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "TEST_TITLEE#{n}"}
    sequence(:content) { |n| "TEST_CONTENT#{n}"}
    sequence(:post_image) { |n| "TEST_POST_IMAGE#{n}"}
  end
end