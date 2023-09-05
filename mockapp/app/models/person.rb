class Person < ApplicationRecord
    has_many :addresses, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :phone_numbers, dependent: :destroy
end
