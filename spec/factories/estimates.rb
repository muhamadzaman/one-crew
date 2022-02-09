FactoryBot.define do
  factory :estimate do
    association :user
    association :job
    name { "MyString" }
    description { "MyString" }
  end
end
