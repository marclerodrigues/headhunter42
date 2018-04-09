class User < ApplicationRecord
  extend Enumerize

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  enumerize :role, in: [:admin, :reviewer, :candidate], default: :candidate

end
