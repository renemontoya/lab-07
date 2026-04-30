class Vet < ApplicationRecord
  has_many :appointments, dependent: :destroy

  before_validation :normalize_email

  validates :first_name, :last_name, :specialization, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :by_specialization, ->(specialization) { where(specialization: specialization) }

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
end