module Common
  module Repository
    extend self

    # Get records applying valid options or return empty set
    def get_with_options(model, options)
      with_valid_options(model, options) do
        limit = options[:limit]
        offset = limit.to_i * (options[:page].to_i - 1)
        model.where(options[:filter]).offset(offset).limit(limit).order(options[:order])
      end
    end

    # Validate options and execute given block or return empty set
    def with_valid_options(model, options)
      if valid_options?(model, options) && block_given?
        yield
      else
        model.none
      end
    end

    # Check query params
    def valid_options?(model, options)
      valid_limit?(options[:limit]) &&
          valid_page?(options[:page]) &&
          valid_filter?(model, options[:filter]) &&
          valid_order?(model, options[:order])
    end

    def valid_limit?(limit)
      limit.nil? || limit.is_a?(Integer)
    end

    def valid_page?(page)
      page.nil? || page.is_a?(Integer)
    end

    def valid_filter?(model, filter)
      filter.nil? || filter.empty? || in_columns?(model, filter.keys)
    end

    def valid_order?(model, order)
      order.nil? || order.empty? || in_columns?(model, order.keys)
    end

    # Verify if given fields are model columns
    def in_columns?(model, fields)
      !(model.columns.map{|c| c.name.to_sym} & fields.map(&:to_sym)).empty?
    end
  end
end
