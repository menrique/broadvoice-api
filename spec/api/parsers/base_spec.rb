describe Parsers::Base do
  let(:params) { { only: 'a test' } }
  let(:subject) { described_class.new(params) }

  it {is_expected.to respond_to(:params)}

  describe '#parse' do
    it 'is expect to return the parsed parameters' do
      expect(subject.parse).to eq params
    end
  end

  describe '.parse' do
    it 'is expect to return the parsed parameters' do
      expect(described_class.parse(params)).to eq subject.parse
    end
  end
end