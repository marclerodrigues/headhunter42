module Admin
    class CompaniesController < ::Admin::BaseController
    before_action: :set_company, only: [:edit, :update]

    def update
      if @company.update_attributes(company_params)
        flash[:notice] = "Company was successfully updated"
        redirect_to root_path
      else
        flash[:error] = "Error to update the company"
        render :edit
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
end
