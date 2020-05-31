FactoryBot.define do
  factory :company, class: Companies::Company do
    name  { "#{Faker::Company.unique.name} (#{Faker::Company.unique.industry})" }

    trait :with_cities do
      company_cities { build_list :company_city, 2, :with_city }
    end

    trait :valid do
    end
  end
end
