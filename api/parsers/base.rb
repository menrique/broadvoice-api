module Parsers
  class Base
    attr_accessor :params

    def initialize(params)
      self.params = params
    end

    def parse
      symbolize(params)
    end

    def self.parse(params)
      new(params).parse
    end
    
    protected
    
    def symbolize(params)
      if params.is_a? Hash
        params.inject({}){|result,(k,v)| result[k.to_sym] =  symbolize(v); result}
      elsif params.is_a? Array
        params.inject([]){|result,v| result << symbolize(v); result}
      else
        params
      end
    end
  end
end