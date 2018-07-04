module Admin
  class VacanciesController < ::Admin::BaseController
    before_action :set_vacancy, only: [:show, :edit, :destroy, :update]
    before_action :set_pipelines_for_select, only: [:new, :create, :edit, :update]
    load_and_authorize_resource

    def index
      @vacancies = Vacancy.all.page(params[:page])
    end

    def show
      @pipeline = Pipeline.find(@vacancy.pipeline_id)
    end

    def new
      @vacancy = Vacancy.new
    end

    def create
      @vacancy = Vacancy.new(vacancy_params)

      if @vacancy.save
        flash[:notice] = t('messages.vacancy_created')
        redirect_to admin_vacancy_path(@vacancy)
      else
        flash[:alert] = @vacancy.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @vacancy.update_attributes(vacancy_params)
        flash[:notice] = t('messages.vacancy_updated')
        redirect_to admin_vacancy_path(@vacancy)
      else
        flash[:alert] = @vacancy.errors.full_messages
        render :edit
      end
    end

    def destroy
      @vacancy.destroy
      redirect_to admin_vacancies_path, notice: t('messages.destroyed_with')
    end

    private

    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    def set_pipelines_for_select
      @pipeline_options_for_select = Pipeline.all
    end

    def vacancy_params
      params.require(:vacancy).permit(
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
