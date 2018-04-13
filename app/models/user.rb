class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  enumerize :role, in: [:admin, :reviewer, :candidate], default: :candidate, predicates: true
end
