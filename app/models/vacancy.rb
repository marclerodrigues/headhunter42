class Vacancy < ApplicationRecord
  belongs_to :pipeline

  has_many :applications, dependent: :destroy

  validates :name, :description, :perks, presence: true

  scope :active, -> { where(active: true) }
end
