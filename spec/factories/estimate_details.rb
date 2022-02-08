FactoryBot.define do
  factory :estimate_detail do
    job { "MyString" }
    units { "9.99" }
    time { "9.99" }
    rate { "9.99" }
    cost { "9.99" }
    margin_multiple { "9.99" }
    bid { "9.99" }
    estimate { nil }
    estimate_category { 'crew' }
    unit_of_measure { 'hr' }
  end
end
