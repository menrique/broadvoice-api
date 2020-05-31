describe Presenters::Resource do
  let(:obj) { build(:city, :valid) }
  let(:subject) { described_class.new(obj) }

  it {is_expected.to be_a(Presenters::Base)}

  describe '#present' do
    it 'is expect to return the object Json representation' do
      expect(subject.present).to eq obj.as_json
    end

    context 'selecting attributes' do
      it 'is expect to return the object Json representation with the selected attributes only' do
        selected = [:name]
        expect(subject.present(only: selected)).to eq obj.as_json(only: selected)
      end
    end

    context 'excluding attributes' do
      it 'is expect to return the object Json representation except the excluded attributes' do
        excluded = [:created_at, :updated_at]
        expect(subject.present(except: excluded)).to eq obj.as_json(except: excluded)
      end
    end

    context 'including relations' do
      it 'is expect to return the object Json representation with included relations and nested options' do
        included = { companies: {only: :name} }
        expect(subject.present(include: included)).to eq obj.as_json(include: included)
      end
    end
  end
end