describe Presenters::Error do
  let(:obj) { Exception.new('Boom!') }
  let(:subject) { described_class.new(obj) }

  it {is_expected.to be_a(Presenters::Common)}

  describe '#present' do
    it 'is expect to return the error message as a Hash' do
      expect(subject.present).to eq({error: obj.message})
    end
  end
end