class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
  has_many :treatments, dependent: :destroy

  # Asegúrate de que el enum tenga sus opciones. 
  # Si ya lo tenías como lista o hash, revisa que no falten las llaves { }
  enum :status, { scheduled: 0, in_progress: 1, completed: 2, cancelled: 3 }

  validates :date, :reason, :status, presence: true
end