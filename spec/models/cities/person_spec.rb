describe Companies::Company, type: :model do
  let(:subject) { build :person, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:name) }
  it { should respond_to(:email) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
