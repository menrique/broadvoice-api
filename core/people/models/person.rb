module People
  class Person < ActiveRecord::Base

    # Associations
    has_many :person_cities, dependent: :destroy
    has_many :cities, class_name: 'Cities::City', through: :person_cities

    has_many :person_companies, dependent: :destroy
    has_many :companies, class_name: 'Companies::Company', through: :person_companies

    # Validations
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
  end
end