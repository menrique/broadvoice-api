FactoryBot.define do
  factory :company_city, class: Companies::CompanyCity do

    trait :with_company do
      company { build :company, :valid }
    end

    trait :with_city do
      city { build :city, :valid }
    end

    trait :valid do
      with_company
      with_city
    end
  end
end
