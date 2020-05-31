module Companies
  class CompanyCity < ActiveRecord::Base

    # Associations
    belongs_to :company
    belongs_to :city, class_name: 'Cities::City'

    # Validations
    validates :company, presence: true, uniqueness: {scope: :city_id}
    validates :city, presence: true
  end
end