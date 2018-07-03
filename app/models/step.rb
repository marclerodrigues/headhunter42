class Step < ApplicationRecord
  belongs_to :pipeline, optional: true
  has_many :skills, dependent: :destroy

  accepts_nested_attributes_for :skills, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
  
  validates :name, :description, :order, presence: true
  validates :order, uniqueness: { scope: :pipeline_id }
end
