class Application < ApplicationRecord
  belongs_to :vacancy
  belongs_to :user

  attachment :resume
  attachment :cover_letter
end
