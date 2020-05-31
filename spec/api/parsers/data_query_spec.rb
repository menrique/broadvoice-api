describe Parsers::DataQuery do
  let(:params) { { name: 'jane', order: 'name:asc,email:desc', limit: '5' } }
  let(:subject) { described_class.new(params) }

  it {is_expected.to be_a(Parsers::Base)}
  it {is_expected.to respond_to(:params)}

  describe '#parse' do
    it 'is expect to return the parsed parameters' do
      expect(subject.parse).to eq({ filter: { name: 'jane' },
                                    order: { name: 'asc', email: 'desc' },
                                    limit: 5})
    end

    context ':order' do
      context 'when missing' do
        let(:params) { { name: 'jane', limit: '5' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:order)
        end
      end

      context 'when empty' do
        let(:params) { { name: 'jane', order: '', limit: '5' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:order)
        end
      end
    end

    context ':name' do
      context 'when missing' do
        let(:params) { { order: 'name:asc,email:desc', limit: '5' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:name)
        end
      end

      context 'when empty' do
        let(:params) { { name: '', order: 'name:asc,email:desc', limit: '5' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:name)
        end
      end
    end

    context ':limit' do
      context 'when missing' do
        let(:params) { { name: 'jane', order: 'name:asc,email:desc' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:limit)
        end
      end

      context 'when empty' do
        let(:params) { { name: 'jane', order: 'name:asc,email:desc', limit: '' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:limit)
        end
      end
    end
  end
end