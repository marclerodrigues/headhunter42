class Pipeline < ApplicationRecord
  has_many :steps, dependent: :destroy

  accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
  validates :name, presence: true
end
