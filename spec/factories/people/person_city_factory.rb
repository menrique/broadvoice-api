FactoryBot.define do
  factory :person_city, class: People::PersonCity do

    trait :with_person do
      person { build :person, :valid }
    end

    trait :with_city do
      city { build :city, :valid }
    end

    trait :valid do
      with_person
      with_city
    end
  end
end
