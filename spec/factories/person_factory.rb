FactoryBot.define do
  factory :person, class: People::Person do
    name  { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }

    trait :valid do
    end
  end
end
