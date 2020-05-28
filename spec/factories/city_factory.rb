FactoryBot.define do
  factory :city, class: Cities::City do
    name  { Faker::Address.unique.city }
    state { Faker::Address.state_abbr }

    trait :valid do
    end
  end
end
