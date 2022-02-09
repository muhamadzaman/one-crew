FactoryBot.define do
  factory :job do
    association :user
    name { "MyString" }
    address { "MyString" }
    description { "MyString" }
  end
end
