describe Cities::Repository do
  let(:subject) { described_class }
  let(:factory) { :city }

  describe '.get' do

    context 'when options are supplied' do
      let!(:records) { create_list(factory, 10, :valid, state: %w[FL NY].sample) }
      let(:options) { {filter: { state: 'FL' }, limit: 5, order: { name: 'asc' }} }

      it 'is expect to return the available cities' do
        expect(subject.get(options)).to eq Cities::City.where(options[:filter]).limit(options[:limit]).order(options[:order])
      end
    end

    context 'when there is no options' do
      before do
        create_list(factory, 10, :valid)
      end

      it 'is expect to return the available cities' do
        expect(subject.get).to eq Cities::City.where(nil)
      end
    end
  end
end