module People
  class PersonCompany < ActiveRecord::Base

    # Associations
    belongs_to :person
    belongs_to :company, class_name: 'Companies::Company'

    # Validations
    validates :person, presence: true, uniqueness: {scope: :company_id}
    validates :company, presence: true
  end
end