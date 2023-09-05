class Email < ApplicationRecord
  belongs_to :person

  validates :email_address, presence: true
  validate :valid_email_format

  private

  def valid_email_format
    # Regex for a valid email format
    unless email_address =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      errors.add(:email_address, 'Invalid email address')
    end
  end
end
