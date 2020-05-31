module Cities
  module Repository
    extend Common::Repository

    # Seed DB
    def self.seed(prog_indicator)

      # Create cities
      cities = FactoryBot.build_list(:city, 100, :valid) do |city|
        city.save!
        prog_indicator.next
      end
      cities
    end

    # Get all available records
    def self.get(options = {})
      get_with_options(Cities::City, options)
    end
  end
end
