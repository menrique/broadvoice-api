describe Companies::CompanyCity, type: :model do
  let(:subject) { build :company_city, :valid }

  # Factory
  it { should be_valid }

  # Associations
  it { should belong_to(:company) }
  it { should belong_to(:city) }

  # Validations
  it { should validate_presence_of(:company) }
  it { should validate_uniqueness_of(:company).scoped_to(:city_id) }
  it { should validate_presence_of(:city) }
end
