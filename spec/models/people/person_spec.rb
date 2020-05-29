describe Companies::Company, type: :model do
  let(:subject) { build :person, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:name) }
  it { should respond_to(:email) }

  # Associations
  it { should have_many(:person_cities) }
  it { should have_many(:cities) }
  it { should have_many(:person_companies) }
  it { should have_many(:companies) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
