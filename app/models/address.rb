require 'json'

class Address < ApplicationRecord
  belongs_to :person

  validates :street, :town, :zip_code, presence: true
  validates :country, inclusion: { in: :countries_list, message: "is not a valid country" }
  
  validate :country_must_be_in_list

  def countries_list
    file = Rails.root.join('config', 'countries.json')
    JSON.parse(File.read(file))
  end

  private

  def country_must_be_in_list
    unless countries_list.include?(country)
      errors.add(:country, 'Invalid country')
    end
  end
end
