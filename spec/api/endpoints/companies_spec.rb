describe Sinatra::Application do
  let(:app) { described_class }
  let(:records) { create_list :company, 3 }
  let(:default_presentation) { { except: [:created_at, :updated_at] } }
  let(:result) { Presenters::Resource.present(Companies::Repository.get, default_presentation) }

  describe 'GET /companies' do
    let(:route) { '/companies' }

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
      let(:route) { '/companies?limit=2&order=name:desc&only=name&page=1' }
      let(:data_query) { { limit: 2, order: {name: :desc}, page: 1 } }
      let(:presentation_query) { { only: [:name] } }
      let(:result) { Presenters::Resource.present(Companies::Repository.get(data_query), presentation_query) }

      it 'is expected to return the JSON collection applying given query options' do
        expect(last_response.body).to eq(result.to_json)
      end
    end
  end

  describe 'GET /companies/:id' do
    let(:record) { records.sample }
    let(:route) { "/companies/#{record.id}" }
    let(:relations) { { include: {cities: {only: [:id, :name, :state]}} } }
    let(:result) { Presenters::Resource.present(
        Companies::Repository.get(filter: { id: record.id }).preload(:cities),
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
      let(:route) { "/companies/#{record.id}?only=name" }
      let(:presentation_query) { { only: [:name] } }
      let(:result) { Presenters::Resource.present(
          Companies::Repository.get(filter: { id: record.id }).preload(:cities),
          {only: :name}.merge(relations)
      ).first }

      it 'is expected to return the JSON object applying given query options' do
        expect(last_response.body).to eq(result.to_json)
      end
    end
  end
end