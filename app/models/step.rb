class Step < ApplicationRecord
  belongs_to :pipeline, optional: true
  has_many :skills, dependent: :destroy

  after_validation :save_new_step
  accepts_nested_attributes_for :skills, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true

  validates :name, :description, :order, presence: true

  private

  def save_new_step
    old_step = Step.find_by(order: self.order, pipeline_id: self.pipeline_id)
    unless old_step.blank?
      old_step.destroy
    end
  end
end
