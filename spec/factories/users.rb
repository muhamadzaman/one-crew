# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    uid { SecureRandom.uuid }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Name.name }
    role do
      Role.find_by(name: 'admin') || create(:role, :admin)
    end

    trait :contractor do
      role { Role.find_by(name: 'contractor') || create(:role, :contractor) }
    end
  end
end
