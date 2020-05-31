module Presenters
  class Resource < Base

    def present(options = {})
      obj.as_json(options)
    end

    def self.present(obj, options = {})
      collection?(obj) ? obj.map{|elem| new(elem).present(options)} : new(obj).present(options)
    end
  end
end