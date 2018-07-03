module Admin
  class SkillsController < ::Admin::BaseController
    before_action :set_skill
    load_and_authorize_resource

    def show
    end

    def edit
    end

    def update
      if @skill.update(skill_params)
        redirect_to admin_pipelines_path, notice: t('messages.skill_updated')
      else
        flash[:alert] = @skill.errors.full_messages
        render :edit
      end
    end

    def destroy
      @skill.destroy
      redirect_to admin_pipelines_path, notice: t('messages.destroyed_with')
    end

    private

    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:name, :description, :step_id)
    end
  end
end
