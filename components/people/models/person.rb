module People
  class Person < ActiveRecord::Base

    # Validations
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
  end
end