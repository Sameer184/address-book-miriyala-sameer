class Person < ApplicationRecord
    VALID_SALUTATIONS = ['Mr.', 'Mrs.', 'Ms.'].freeze
  
    has_many :addresses, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :phone_numbers, dependent: :destroy
  
    validates :salutation, inclusion: { in: VALID_SALUTATIONS, message: "must be one of: #{VALID_SALUTATIONS.join(', ')}" }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :ssn, numericality: { only_integer: true }, length: { is: 9 }, allow_blank: true
    
    validate :valid_ssn
  
    private
  
    def valid_ssn
      if ssn.present? && ssn !~ /\A\d{9}\z/
        errors.add(:ssn, 'SSN must be exactly 9 digits and numeric')
      end
    end
  end
  