class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments, dependent: :destroy
  before_save :capitalize_name
  validates :name, :date_of_birth, presence: true
  validates :species, presence: true, inclusion: { in: %w[dog cat rabbit bird reptile other] }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validate :date_cannot_be_in_future

  scope :by_species, ->(s) { where(species: s) }

  private
  def capitalize_name
    self.name = name.capitalize if name.present?
  end
  def date_cannot_be_in_future
    errors.add(:date_of_birth, "no puede ser futura") if date_of_birth.present? && date_of_birth > Date.today
  end
end