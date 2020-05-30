module People
  module Repository

    # Seed DB
    def self.seed(cities, prog_indicator)

      # Create people
      FactoryBot.build_list(:person, 10000, :valid).each do |person|
        person.save!
        linked_cities = []
        linked_companies = []

        # Assign cities where the person lives
        cities.sample(rand(1..2)).each do |city|
          unless linked_cities.include?(city)
            FactoryBot.create(:person_city, person: person, city: city)
            linked_cities << city
          end

          # Assign companies where the person works
          city.companies.sample(rand(1..2)).each do |company|
            unless linked_companies.include?(company)
              FactoryBot.create(:person_company, person: person, company: company)
              linked_companies << company
            end
          end
        end

        prog_indicator.next
        person
      end
    end

    # Get all available records
    def self.get(filter = {})
      People::Person.where(filter)
    end
  end
end
