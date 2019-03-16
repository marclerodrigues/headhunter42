class User < ApplicationRecord
  extend Enumerize
  attr_accessor :skip_password_validation

  has_many :applications, dependent: :destroy

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :invitable
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  enumerize :role, in: [:admin, :reviewer, :candidate], default: :candidate, predicates: true

  scope :admins, -> { where(role: :admin) }
  scope :reviewers, -> { where(role: :reviewer) }
  scope :candidates, -> { where(role: :candidate) }
  scope :admins_and_reviewers, -> { where(role: [:admin, :reviewer]) }

  def to_s
    "#{first_name} #{last_name}"
  end

  private

  def password_required?
    return false if skip_password_validation
    super
  end
end
