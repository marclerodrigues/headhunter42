class Vacancy < ApplicationRecord
  belongs_to :pipeline

  validates :name, :description, :perks, presence: true
end
