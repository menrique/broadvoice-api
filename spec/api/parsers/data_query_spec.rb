describe Parsers::DataQuery do
  let(:params) { { name: 'jane', order: 'name:asc,email:desc', limit: '100', page: '5' } }
  let(:subject) { described_class.new(params) }

  it {is_expected.to be_a(Parsers::Base)}
  it {is_expected.to respond_to(:params)}

  describe '#parse' do
    it 'is expect to return the parsed parameters' do
      expect(subject.parse).to eq({ filter: { name: 'jane' },
                                    order: { name: 'asc', email: 'desc' },
                                    limit: 100, page: 5})
    end

    context ':order' do
      context 'when missing' do
        before do
          params.delete(:order)
        end

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:order)
        end
      end

      context 'when empty' do
        before do
          params[:order] = ''
        end

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:order)
        end
      end
    end

    context ':filter' do
      context 'when missing' do
        before do
          params.delete(:name)
        end

        it 'is expect to be an empty hash' do
          expect(subject.parse[:filter]).to eq({})
        end
      end
    end

    context ':limit' do
      context 'when missing' do
        before do
          params.delete(:limit)
        end

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:limit)
        end
      end

      context 'when empty' do
        before do
          params[:limit] = ''
        end

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:limit)
        end
      end
    end

    context ':page' do
      context 'when missing' do
        before do
          params.delete(:page)
        end

        it 'is expect to be 0' do
          expect(subject.parse[:page]).to be 0
        end
      end

      context 'when empty' do
        before do
          params[:page] = ''
        end

        it 'is expect to not return the key' do
          expect(subject.parse[:page]).to be 0
        end
      end
    end
  end
end