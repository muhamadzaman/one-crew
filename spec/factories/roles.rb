# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { 'client' }

    trait :admin do
      name { 'admin' }
    end

    trait :contractor do
      name { 'contractor' }
    end
  end
end
