module Presenters
  class Error < Base
    def present
      { error: obj.message }
    end
  end
end