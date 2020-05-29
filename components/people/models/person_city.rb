module People
  class PersonCity < ActiveRecord::Base

    # Associations
    belongs_to :person
    belongs_to :city, class_name: 'Cities::City'

    # Validations
    validates :person, presence: true, uniqueness: {scope: :city_id}
    validates :city, presence: true
  end
end