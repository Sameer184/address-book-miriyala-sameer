class PhoneNumber < ApplicationRecord
  belongs_to :person

  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "should be numeric and a 10-digit number" }
end
