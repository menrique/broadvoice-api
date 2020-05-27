module Helpers
  module Errors
    def self.handle(error)
      { error: error.message }
    end
  end
end