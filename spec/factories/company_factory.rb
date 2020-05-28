FactoryBot.define do
  factory :company, class: Companies::Company do
    name  { Faker::Company.unique.name }

    trait :valid do
    end
  end
end
