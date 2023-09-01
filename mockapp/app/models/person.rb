class Person < ApplicationRecord
    has_many :addresses
    has_many :emails
    has_many :phone_numbers
end
