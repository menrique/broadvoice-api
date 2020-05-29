module Presenters
  class Resource
    attr_accessor :obj
    BLACKLIST = %w{created_at updated_at}

    def initialize(obj)
      self.obj = obj
    end

    def render
      obj.as_json(only: obj.attributes.keys - BLACKLIST)
    end

    def self.render(collection)
      collection.map{|obj| new(obj).render}
    end
  end
end