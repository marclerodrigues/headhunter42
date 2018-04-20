class CompaniesController < ApplicationController
  respont_to: :html
  
  def update
    @company = CompanyForm.find(params[:id])
    @company.update_attributes(params[:company])
  end

  def edit
    @company = CompanyForm.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:logo)
  end
end
