module Cities
  class City < ActiveRecord::Base

    # Validations
    validates :name, presence: true, uniqueness: { scope: :state }
    validates :state, presence: true
  end
end