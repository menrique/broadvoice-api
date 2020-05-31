module Parsers
  class Query < Base

    def parse
      presentation_query = Parsers::PresentationQuery.parse(params)
      presentation_query[:except] || []
      presentation_query[:except] |= %w[created_at updated_at]
      {
          data:         Parsers::DataQuery.parse(params),
          presentation: presentation_query,
      }
    end

  end
end