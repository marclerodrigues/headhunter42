module Admin
  class CompaniesController < ::Admin::BaseController
    before_action :company, only: [:edit, :update]

    def update
      @company = CompanyForm.new(company_params.merge({ company: Company.first }))
      if @company.update
        redirect_to root_path, flash: { notice: t(:company_successfully_updated) }
      else
        render :edit, flash: { error: t(:error_while_updating_the_company) }
      end
    end

    def edit
      @company = CompanyForm.new
    end

    private

    def company_params
      params.require(:company).permit(
                :name,
                :website,
                :phone_number,
                :address,
                :logo
      )
    end
  end
end
