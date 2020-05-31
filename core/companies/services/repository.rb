module Companies
  module Repository

    # Seed DB
    def self.seed(cities, prog_indicator)
      cities_count = cities.count

      # Create companies
      FactoryBot.build_list(:company, 100, :valid).each do |company|
        company.save!

        # Assign in what cities the company operates
        cities.sample(rand(1..cities_count)).each do |city|
          FactoryBot.create(:company_city, city: city, company: company)
        end

        prog_indicator.next
        company
      end
    end

    # Get all available records
    def self.get(options = {})
      Companies::Company.where(options[:filter]).limit(options[:limit]).order(options[:order])

    end
  end
end
