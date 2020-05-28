module Companies
  module Repository

    # Seed DB
    def self.seed
      FactoryBot.create_list(:company, 100, :valid)
    end

    # Get all available records
    def self.get(filter = {})
      Companies::Company.where(filter)
    end

  end
end
