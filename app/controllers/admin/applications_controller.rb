module Admin
  class ApplicationsController < ::Admin::BaseController
    before_action :set_application, only: [:show, :edit, :destroy, :update]
    load_and_authorize_resource

    def index
      @applications = Application.includes(:user).page(params[:page])
    end

    def show
    end

    def new
      @application = Application.new
    end

    def create
      @application = Application.new(application_params)

      if @application.save
        flash[:notice] = t('messages.application_created')
        redirect_to admin_application_path(@application)
      else
        flash[:alert] = @application.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @application.update_attributes(application_params)
        flash[:notice] = t('messages.application_updated')
        redirect_to admin_application_path(@application)
      else
        flash[:alert] = @application.errors.full_messages
        render :edit
      end
    end

    def destroy
      @application.destroy
      redirect_to admin_vacancies_path, notice: t('messages.destroyed_with')
    end

    private

    def set_application
      @application = Application.find(params[:id])
    end

    def application_params
      params.require(:application).permit(
        :name,
        :description,
        :perks,
        :min_salary,
        :max_salary,
        :start_date,
        :end_date,
        :active,
        :pipeline_id
      )
    end
  end
end
