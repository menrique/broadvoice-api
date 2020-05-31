module Cities
  module Repository

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
      Cities::City.where(options[:filter]).limit(options[:limit]).order(options[:order])
    end
  end
end
