module Presenters
  class Error < Common
    def present
      { error: obj.message }
    end
  end
end