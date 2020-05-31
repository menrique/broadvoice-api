FactoryBot.define do
  factory :person, class: People::Person do
    name  { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }

    trait :with_cities do
      person_cities { build_list :person_city, 2, :with_city }
    end

    trait :with_companies do
      person_companies { build_list :person_company, 2, :with_company }
    end

    trait :valid do
    end
  end
end
