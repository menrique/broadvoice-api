module Parsers
  class DataQuery < Base
    IGNORED = [:order, :limit, :page, :only, :except]

    # Decompose query params to filter records, limit its amount and order the set
    def parse
      symbolize(
          { filter: parse_filter(params),
            order:  parse_order(params[:order]),
            limit:  parse_limit(params[:limit]),
            page:   parse_page(params[:page]),
          }.compact
      )
    end

    private

    # EX: name=robert -> {name: 'robert'}
    def parse_filter(filter)
      filter.reject{|param, _| IGNORED.include?(param.to_sym)}
    end

    # EX: order=name:asc,email:desc -> order: {name: :asc, email: :desc}
    def parse_order(order)
      Hash[order.to_s.split(',').map{|criteria| criteria.split(':')}] unless order.nil? || order.empty?
    end

    # EX: limit=100 -> {limit: 100}
    def parse_limit(limit)
      limit.to_i unless limit.nil? || limit.empty?
    end

    # EX: page=5 -> {page: 5}
    def parse_page(page)
      page.to_i
    end

  end
end