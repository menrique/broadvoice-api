module Presenters
  class Common
    attr_accessor :obj

    def initialize(obj)
      self.obj = obj
    end

    def present
      obj.to_s
    end

    def self.present(obj)
      collection?(obj) ? obj.map{|elem| new(elem).present} : new(obj).present
    end

    private

    def self.collection?(obj)
      obj.is_a?(Array) || obj.is_a?(ActiveRecord::Relation)
    end
  end
end