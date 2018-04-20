class CompaniesController < ApplicationController
  before_action: :set_company, only: [:edit, :update]

  def update
    respond_to do |format|
      if @company.update_attributes(:company_params)
        format.html { redirect_to @company, notice: "Company was sucessfully updated" }
      else
        format.hmtl { render :edit, notice: "Company couldn't be updated" }
      end
  end

  def edit
  end

  def set_company
    @company = CompanyForm.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :website, :phone_numbers, :address, :logo)
  end
end
