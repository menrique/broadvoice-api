module Cities
  module Repository

    # Seed DB
    def self.seed
      FactoryBot.create_list(:city, 100, :valid)
    end

    # Get all available records
    def self.get(filter = {})
      Cities::City.where(filter)
    end

  end
end