class CompanyForm
  include ActiveModel::Model

  def self.model_name
      ActiveModel::Name.new(self, nil, 'Company')
  end

  attr_accessor(
      :name,
      :website,
      :phone_numbers,
      :address,
      :logo,
      :company
  )

  validates :name, presence: true
  validates :website, presence: true
  validates :phone_numbers, presence: true
  validates :address, presence: true
  validates :logo, presence: true


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
