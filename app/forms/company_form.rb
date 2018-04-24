Class CompanyForm
  include ActiveModel::Model

  attr_accessor( :name, :website, :phone_numbers, :address, :logo)

  validates :name, presence: true
  validates :website, presence: true
  validates :phone_numbers, presence: true
  validates :address, presence: true
  validates :logo, presence: true
end
