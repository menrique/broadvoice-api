describe Cities::Repository do
  let(:subject) { described_class }
  let(:factory) { :city }

  it 'is expected to extend from Common::Repository' do
    expect(subject.ancestors).to include Common::Repository
  end

  describe '.get' do
    let!(:records) { create_list(factory, 10, :valid, state: %w[FL NY].sample) }

    context 'when options are supplied' do
      let(:options) { {filter: { state: 'FL' }, limit: 100, page: 5, order: { name: 'asc' }} }

      it 'is expect to return available records applying such options' do
        expect(subject.get(options)).to match_array described_class.get_with_options(Cities::City, options)
      end
    end

    context 'when there is no options' do

      it 'is expect to return all available records' do
        expect(subject.get).to match_array Cities::City.where(nil)
      end
    end
  end
end