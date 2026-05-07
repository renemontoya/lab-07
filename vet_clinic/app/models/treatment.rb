class Treatment < ApplicationRecord
  belongs_to :appointment

  validates :name, :administered_at, presence: true
  has_rich_text :clinical_notes
end