class CompanyForm
  include ActiveModel::Model
  extend Refile::Attachment

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Company')
  end

  attr_accessor(
      :name,
      :website,
      :phone_number,
      :address,
      :logo,
      :logo_id,
      :company
  )

  validates :name, :website, :phone_number, :address, :logo, presence: true

  attachment :logo, type: :image

  def update
    if valid?
      update_company
    else
      false
    end
  end

  private

  def update_company
    company.update_attributes(company_attributes)
  end

  def company_attributes
    {
      name: name,
      website: website,
      phone_number: phone_number,
      address: address,
      logo: logo
    }
  end
end
