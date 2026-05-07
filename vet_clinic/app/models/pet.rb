class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments, dependent: :destroy
  
  # Agregamos la asociación de la foto aquí arriba
  has_one_attached :photo

  before_save :capitalize_name
  
  validates :name, :date_of_birth, presence: true
  validates :species, presence: true, inclusion: { in: %w[dog cat rabbit bird reptile other] }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  
  # Validaciones personalizadas (la de fecha y la de la foto)
  validate :date_cannot_be_in_future
  validate :acceptable_photo

  scope :by_species, ->(s) { where(species: s) }

  # Todo lo que sea "private" va al final del archivo
  private

  def capitalize_name
    self.name = name.capitalize if name.present?
  end

  def date_cannot_be_in_future
    errors.add(:date_of_birth, "no puede ser futura") if date_of_birth.present? && date_of_birth > Date.today
  end

  def acceptable_photo
    return unless photo.attached?

    if photo.blob.byte_size > 5.megabytes
      errors.add(:photo, "is too big (max 5MB)")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/webp"]
    unless acceptable_types.include?(photo.content_type)
      errors.add(:photo, "must be a JPEG, PNG or WebP")
    end
  end
end