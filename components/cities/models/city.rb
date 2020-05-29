module Cities
  class City < ActiveRecord::Base

    # Associations
    has_many :city_companies, class_name: 'Companies::CompanyCity', dependent: :destroy
    has_many :companies, class_name: 'Companies::Company', through: :city_companies

    has_many :city_people, class_name: 'People::PersonCity', dependent: :destroy
    has_many :people, class_name: 'People::Person', through: :city_people

    # Validations
    validates :name, presence: true, uniqueness: { scope: :state }
    validates :state, presence: true
  end
end