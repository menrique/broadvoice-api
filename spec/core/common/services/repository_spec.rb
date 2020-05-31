describe Common::Repository do
  let(:subject) { described_class }
  let(:model) { Cities::City }
  let(:valid_options) { {filter: { state: 'FL' }, limit: 5, page: 1, order: { name: 'asc' }} }
  let(:invalid_options) { {filter: { missing: 'FL' }, limit: '#', page: '#', order: { unknown: 'asc' }} }

  describe '.get_with_options' do
    let!(:records) { create_list(:city, 10, :valid, state: %w[FL NY].sample) }

    context 'when options are valid' do
      it 'is expect to return available records applying such options' do
        limit = valid_options[:limit]
        offset = limit.to_i * (valid_options[:page].to_i - 1)

        expect(subject.get_with_options(model, valid_options)).to(
            match_array model.where(valid_options[:filter]).offset(offset).limit(limit).order(valid_options[:order])
        )
      end
    end

    context 'when options are invalid' do

      it 'is expected to return no records' do
        expect(subject.get_with_options(model, invalid_options)).to eq model.none
      end
    end
  end

  describe '.with_valid_options' do

    context 'when options are valid' do
      it 'is expected to yield given block' do
        expect{|block| subject.with_valid_options(model, valid_options, &block)}.to yield_control
      end
    end

    context 'when options are invalid' do
      it 'is expected to not yield given block' do
        expect{|block| subject.with_valid_options(model, invalid_options, &block)}.to_not yield_control
      end

      it 'is expected to return no records' do
        expect(subject.with_valid_options(model, invalid_options)).to eq model.none
      end
    end
  end

  describe '.valid_options?' do

    context 'when options are valid' do
      it 'is expected to be true' do
        expect(subject.valid_options?(model, valid_options)).to be_truthy
      end
    end

    context 'when the :filter is invalid' do
      let(:invalid_option) { valid_options.merge(filter: invalid_options[:filter]) }

      it 'is expected to be false' do
        expect(subject.valid_options?(model, invalid_option)).to be_falsey
      end
    end

    context 'when the :limit is invalid' do
      let(:invalid_option) { valid_options.merge(limit: invalid_options[:limit]) }

      it 'is expected to be false' do
        expect(subject.valid_options?(model, invalid_option)).to be_falsey
      end
    end

    context 'when the :order is invalid' do
      let(:invalid_option) { valid_options.merge(order: invalid_options[:order]) }

      it 'is expected to be false' do
        expect(subject.valid_options?(model, invalid_option)).to be_falsey
      end
    end

    context 'when the :page is invalid' do
      let(:invalid_option) { valid_options.merge(page: invalid_options[:page]) }

      it 'is expected to be false' do
        expect(subject.valid_options?(model, invalid_option)).to be_falsey
      end
    end
  end

  describe '.valid_limit?' do

    context 'when the filter is invalid' do
      it 'is expected to be true' do
        expect(subject.valid_limit?(valid_options[:limit])).to be_truthy
      end
    end

    context 'when the filter is invalid' do
      it 'is expected to be false' do
        expect(subject.valid_limit?(invalid_options[:limit])).to be_falsey
      end
    end
  end

  describe '.valid_page?' do

    context 'when the filter is invalid' do
      it 'is expected to be true' do
        expect(subject.valid_page?(valid_options[:page])).to be_truthy
      end
    end

    context 'when the filter is invalid' do
      it 'is expected to be false' do
        expect(subject.valid_page?(invalid_options[:page])).to be_falsey
      end
    end
  end

  describe '.valid_filter?' do

    context 'when the filter is invalid' do
      it 'is expected to be true' do
        expect(subject.valid_filter?(model, valid_options[:filter])).to be_truthy
      end
    end

    context 'when the filter is invalid' do
      it 'is expected to be false' do
        expect(subject.valid_filter?(model, invalid_options[:filter])).to be_falsey
      end
    end
  end

  describe '.valid_order?' do

    context 'when the filter is invalid' do
      it 'is expected to be true' do
        expect(subject.valid_order?(model, valid_options[:order])).to be_truthy
      end
    end

    context 'when the filter is invalid' do
      it 'is expected to be false' do
        expect(subject.valid_order?(model, invalid_options[:order])).to be_falsey
      end
    end
  end
end