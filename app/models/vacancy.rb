class Vacancy < ApplicationRecord
  belongs_to :pipeline

  validates :name, :description, :perks, :min_salary, :max_salary, :start_date, :end_date, presence: true
end
