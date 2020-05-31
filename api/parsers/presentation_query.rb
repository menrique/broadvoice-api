module Parsers
  class PresentationQuery < Base

    def parse
      symbolize(
          { only:   parse_fields(params[:only]),
            except: parse_fields(params[:except]),
          }.compact
      )
    end

    private

    # EX: only=name,email except=phone
    def parse_fields(fields)
      fields.to_s.split(',') unless fields.nil? || fields.empty?
    end
  end
end