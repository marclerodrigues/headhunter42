module Admin
  class StepsController < ::Admin::BaseController
    before_action :set_step
    load_and_authorize_resource

    def show
      @skills = @step.skills
    end

    def edit
    end

    def update
      if @step.update(step_params)
        redirect_to admin_pipelines_path, notice: t('messages.step_updated')
      else
        flash[:alert] = @step.errors.full_messages
        render :edit
      end
    end

    def destroy
      @step.destroy
      redirect_to admin_pipelines_path, notice: t('messages.destroyed_with')
    end

    private

    def set_step
      @step = Step.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:name, :description, :order, :pipeline_id,
        skills_attributes: [:id, :name, :description, :_destroy]
      )
    end
  end
end
