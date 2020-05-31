describe Parsers::Query do
  let(:params) { { name: 'jane', order: 'name:asc,email:desc', limit: '5', only: 'name,description', except: 'email' } }
  let(:subject) { described_class.new(params) }

  it {is_expected.to be_a(Parsers::Base)}
  it {is_expected.to respond_to(:params)}

  describe '#parse' do
    it 'is expect to return the parsed parameters excluding created_at and updated_at by default' do
      expect(subject.parse).to eq({ data: {filter: { name: 'jane' },
                                           order: { name: 'asc', email: 'desc' },
                                           limit: 5},
                                    presentation: {only: %w[name description], except: %w[email created_at updated_at]}
                                  })
    end
  end
end