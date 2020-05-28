module Companies
  class Company < ActiveRecord::Base

    # Validations
    validates :name, presence: true, uniqueness: true
  end
end