FactoryBot.define do
  factory :city, class: Cities::City do
    name  { Faker::Address.unique.city }
    state { Faker::Address.state_abbr }

    trait :with_companies do
      city_companies { build_list :company_city, 2, :with_company }
    end

    trait :with_people do
      city_people { build_list :person_city, 2, :with_person }
    end

    trait :valid do
    end
  end
end
