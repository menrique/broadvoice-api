module Cities
  module Repository

    # Seed DB with cities
    def self.seed
      100.times do
        FactoryBot.create_list :city, 100
      end
    end

    # Get all available cities
    def self.get(filter = {})
      Cities::City.where(filter)
    end

  end
end
