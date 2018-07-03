class Skill < ApplicationRecord
  belongs_to :step, optional: true

  validates :name, :description, presence: true
end
