describe Cities::City, type: :model do
  let(:subject) { build :city, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:name) }
  it { should respond_to(:state) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:state) }
  it { should validate_presence_of(:state) }
end
