class Step < ApplicationRecord
  belongs_to :pipeline, optional: true

  validates :name, :description, :order, presence: true

  validates :order, uniqueness: { scope: :pipeline_id }
end
