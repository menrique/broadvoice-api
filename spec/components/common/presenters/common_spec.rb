describe Presenters::Common do
  let(:obj) { OpenStruct.new(name: Faker::FunnyName.name, description: Faker::FunnyName.four_word_name) }
  let(:subject) { described_class.new(obj) }

  it {is_expected.to respond_to(:obj)}

  describe '#present' do
    it 'is expect to return the object string representation' do
      expect(subject.present).to eq obj.to_s
    end
  end

  describe '.present' do
    context 'when it is a collection' do
      let(:obj) {
        2.times.map{ OpenStruct.new(name: Faker::FunnyName.name, description: Faker::FunnyName.four_word_name) }
      }

      it 'is expect to return an collection of object representations' do
        expect(described_class.present(obj)).to eq obj.map{|elem| described_class.new(elem).present}
      end
    end

    context 'when it is an individual object' do
      it 'is expect to return the object representation' do
        expect(described_class.present(obj)).to eq subject.present
      end
    end
  end
end