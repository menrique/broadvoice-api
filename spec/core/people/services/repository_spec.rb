describe People::Repository do
  let(:subject) { described_class }
  let(:factory) { :person }

  it 'is expected to extend from Common::Repository' do
    expect(subject.ancestors).to include Common::Repository
  end

  describe '.get' do
    let!(:records) { create_list(factory, 10, :valid) }

    context 'when options are supplied' do
      let(:options) { {filter: { name: records.sample.name }, limit: 100, page: 5, order: { name: 'asc' }} }

      it 'is expect to return available records applying such options' do
        expect(subject.get(options)).to match_array described_class.get_with_options(People::Person, options)
      end
    end

    context 'when there is no options' do

      it 'is expect to return all available records' do
        expect(subject.get).to match_array People::Person.where(nil)
      end
    end
  end
end