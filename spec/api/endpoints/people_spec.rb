describe Sinatra::Application do
  let(:app) { described_class }
  let(:records) { create_list :person, 3 }
  let(:default_presentation) { { except: [:created_at, :updated_at] } }
  let(:result) { Presenters::Resource.present(People::Repository.get, default_presentation) }

  describe 'GET /people' do
    let(:route) { '/people' }

    before do
      get url(route)
    end

    it 'is expected to return 200 status code' do
      expect(last_response).to be_ok
    end

    it 'is expected to return the JSON collection using the default presentation' do
      expect(last_response.body).to eq(result.to_json)
    end

    context 'passing query options' do
      let(:route) { '/people?limit=2&order=name:desc&only=name&page=1' }
      let(:data_query) { { limit: 2, order: {name: :desc}, page: 1 } }
      let(:presentation_query) { { only: [:name] } }
      let(:result) { Presenters::Resource.present(People::Repository.get(data_query), presentation_query) }

      it 'is expected to return the JSON collection applying given query options' do
        expect(last_response.body).to eq(result.to_json)
      end
    end
  end

  describe 'GET /people/:id' do
    let(:record) { records.sample }
    let(:route) { "/people/#{record.id}" }
    let(:relations) { {include: {companies: {only: [:id, :name]}, cities: {only: [:id, :name, :state]}}} }
    let(:result) { Presenters::Resource.present(
        People::Repository.get(filter: { id: record.id }).preload(:cities, :companies),
        default_presentation.merge(relations)
    ).first }

    before do
      get url(route)
    end

    it 'is expected to return 200 status code' do
      expect(last_response).to be_ok
    end

    it 'is expected to return the JSON object using the default presentation' do
      expect(last_response.body).to eq(result.to_json)
    end

    context 'passing query options' do
      let(:route) { "/people/#{record.id}?only=name" }
      let(:presentation_query) { { only: [:name] } }
      let(:result) { Presenters::Resource.present(
          People::Repository.get(filter: { id: record.id }).preload(:cities, :companies),
          {only: :name}.merge(relations)
      ).first }

      it 'is expected to return the JSON object applying given query options' do
        expect(last_response.body).to eq(result.to_json)
      end
    end
  end
end