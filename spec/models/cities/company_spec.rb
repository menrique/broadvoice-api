describe Companies::Company, type: :model do
  let(:subject) { build :company, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:name) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
