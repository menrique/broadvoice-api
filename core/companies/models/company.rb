module Companies
  class Company < ActiveRecord::Base

    # Associations
    has_many :company_cities, dependent: :destroy
    has_many :cities, class_name: 'Cities::City', through: :company_cities

    # Validations
    validates :name, presence: true, uniqueness: true
  end
end