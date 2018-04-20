class Company < ApplicationRecord
  respont_to: html
  attachment :logo, type: :image

  def company_params
    params.require(:company).permit(:logo)
  end
end
