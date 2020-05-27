module Cities
  class City < ActiveRecord::Base

    # Validations
    validates :name, presence: true, uniqueness: true
    validates :state, presence: true
  end
end