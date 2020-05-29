describe People::PersonCity, type: :model do
  let(:subject) { build :person_city, :valid }

  # Factory
  it { should be_valid }

  # Associations
  it { should belong_to(:person) }
  it { should belong_to(:city) }

  # Validations
  it { should validate_presence_of(:person) }
  it { should validate_uniqueness_of(:person).scoped_to(:city_id) }
  it { should validate_presence_of(:city) }
end
