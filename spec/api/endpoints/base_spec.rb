describe Sinatra::Application do
  let(:app) { described_class }

  describe 'GET /' do
    let(:route) { '/' }

    before do
      get url(route)
    end

    it 'is expected to return 200 status code' do
      expect(last_response).to be_ok
    end

    it 'is expected to return the proper JSON' do
      expect(last_response.body).to eq({ message: 'Welcome to Broadvoice API' }.to_json)
    end
  end

  describe '404 - Not found' do
    let(:route) { '/not/fount' }

    before do
      get url(route)
    end

    it 'is expected to return 404 status code' do
      expect(last_response.status).to eq 404
    end

    it 'is expected to respond with the error message in JSON' do
      expect(last_response.body).to eq({ error: 'Route not found' }.to_json)
    end
  end

  describe '500 - Server error' do
    let(:route) { '/cities' }
    let(:original_error) { Exception.new('Ups! Something went wrong.') }
    let(:showed_error) { Exception.new('Ups! Something went wrong.') }

    before do
      allow(Presenters::Resource).to receive(:present).and_raise(original_error)
      get url(route)
    end

    it 'is expected to return 500 status code' do
      expect(last_response.status).to eq 500
    end

    it 'is expected to respond with the obfuscated error message in JSON' do
      expect(last_response.body).to eq(Presenters::Error.present(showed_error).to_json)
    end
  end
end