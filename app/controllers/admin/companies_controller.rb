module Admin
  class CompaniesController < ::Admin::BaseController
    load_and_authorize_resource

    def update
      @company = CompanyForm.new(company_params)

      if @company.update
        redirect_to admin_dashboards_path, notice: t("messages.company_was_successfully_updated")
      else
        flash[:alert] = @company.errors.full_messages
        render :edit
      end
    end

    def edit
      @company = Company.first
      @company_form = CompanyForm.new(name: @company.name,
                                      website: @company.website,
                                      phone_number: @company.phone_number,
                                      address: @company.address,
                                      logo_id: @company.logo_id)
    end

    private

    def company_params
      params
        .require(:company)
        .permit(
          :name,
          :website,
          :phone_number,
          :address,
          :logo)
        .merge({ company: Company.first })
    end
  end
end
