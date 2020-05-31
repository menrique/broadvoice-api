describe Parsers::PresentationQuery do
  let(:params) { { only: 'name,description', except: 'email' } }
  let(:subject) { described_class.new(params) }

  it {is_expected.to be_a(Parsers::Base)}
  it {is_expected.to respond_to(:params)}

  describe '#parse' do
    it 'is expect to return the parsed parameters' do
      expect(subject.parse).to eq({only: %w[name description], except: %w[email]})
    end

    context ':only' do
      context 'when missing' do
        let(:params) { { except: 'email' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:only)
        end
      end

      context 'when empty' do
        let(:params) { { only: '', except: 'email' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:only)
        end
      end
    end

    context ':except' do
      context 'when missing' do
        let(:params) { { only: 'name,description' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:except)
        end
      end

      context 'when empty' do
        let(:params) { { only: 'name,description', except: '' } }

        it 'is expect to not return the key' do
          expect(subject.parse.keys).to_not include(:except)
        end
      end
    end
  end
end