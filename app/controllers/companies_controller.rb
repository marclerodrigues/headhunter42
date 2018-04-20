class CompaniesController < ApplicationController

  def update
    @company = CompanyForm.find(params[:id])
    @company.update_attributes(params[:company])
  end

  def edit
    @company = CompanyForm.find(params[:id])
  end
end
