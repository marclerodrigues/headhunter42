module Admin
    class CompaniesController < ::Admin::BaseController
    before_action :company, only: [:edit, :update]


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

    def company
      @company ||= Company.first
    end

    def company_params
       params.require(:company).permit(:name, :website, :phone_number, :address, :logo)
    end
  end
end
