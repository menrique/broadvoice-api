FactoryBot.define do
  factory :person_company, class: People::PersonCompany do

    trait :with_person do
      person { build :person, :valid }
    end

    trait :with_company do
      company { build :company, :valid }
    end

    trait :valid do
      with_person
      with_company
    end
  end
end
