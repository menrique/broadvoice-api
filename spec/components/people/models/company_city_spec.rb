describe People::PersonCompany, type: :model do
  let(:subject) { build :person_company, :valid }

  # Factory
  it { should be_valid }

  # Associations
  it { should belong_to(:person) }
  it { should belong_to(:company) }

  # Validations
  it { should validate_presence_of(:person) }
  it { should validate_uniqueness_of(:person).scoped_to(:company_id) }
  it { should validate_presence_of(:company) }
end
