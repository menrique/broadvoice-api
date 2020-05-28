module People
  module Repository

    # Seed DB
    def self.seed
      FactoryBot.create_list(:person, 10000, :valid)
    end

    # Get all available records
    def self.get(filter = {})
      People::Person.where(filter)
    end

  end
end
