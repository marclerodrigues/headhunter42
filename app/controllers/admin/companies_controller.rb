module Admin
  class CompaniesController < ::Admin::BaseController

    def update
      @company = CompanyForm.new(company_params.merge({ company: Company.first }))

      if @company.update
        redirect_to admin_dashboards_path, notice: 'Company was successfully updated.'
      else
        render :edit, flash: { error: t(:error_while_updating_the_company) }
      end
    end

    def edit
      @company = Company.first
      #@company = CompanyForm.new
      @company_form = CompanyForm.new(name: @company.name,
                                      website: @company.website,
                                      phone_number: @company.phone_number,
                                      address: @company.address,
                                      logo_id: @company.logo_id)
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
