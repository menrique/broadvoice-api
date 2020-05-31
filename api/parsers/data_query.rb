module Parsers
  class DataQuery < Base
    IGNORED = [:order, :limit, :only, :except]

    def parse
      symbolize(
          { filter: parse_filter(params),
            order:  parse_order(params[:order]),
            limit:  parse_limit(params[:limit]),
          }.compact
      )
    end

    private

    # EX: name=robert
    def parse_filter(filter)
      filter.reject{|param, _| IGNORED.include?(param.to_sym)}
    end

    # EX: order=name:asc,email:desc
    def parse_order(order)
      Hash[order.to_s.split(',').map{|criteria| criteria.split(':')}] unless order.nil? || order.empty?
    end

    # EX: limit=100
    def parse_limit(limit)
      limit.to_i unless limit.nil? || limit.empty?
    end

    # EX: only=name,email except=phone
    def parse_fields(fields)
      fields.to_s.split(',') unless fields.nil? || fields.empty?
    end

  end
end