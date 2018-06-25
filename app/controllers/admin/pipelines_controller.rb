module Admin
  class PipelinesController < ::Admin::BaseController
    before_action :set_pipeline, only: [:show, :edit, :destroy, :update]
    load_and_authorize_resource

    def index
      @pipelines = Pipeline.all.page(params[:page])
    end

    def show
      @steps = @pipeline.steps.order(:order)
    end

    def new
      @pipeline = Pipeline.new
    end

    def create
      @pipeline = Pipeline.new(pipeline_params)

      if @pipeline.save
        flash[:notice] = t('messages.pipeline_created')
        redirect_to admin_pipeline_path(@pipeline)
      else
        flash[:alert] = @pipeline.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @pipeline.update_attributes(pipeline_params)
        flash[:notice] = t('messages.pipeline_updated')
        redirect_to admin_pipeline_path(@pipeline)
      else
        flash[:alert] = @pipeline.errors.full_messages
        render :edit
      end
    end

    def destroy
      @pipeline.destroy
      redirect_to admin_pipelines_path, notice: t('messages.destroyed_with')
    end

    private

    def set_pipeline
      @pipeline = Pipeline.find(params[:id])
    end

    def pipeline_params
      params.require(:pipeline).permit(:name, steps_attributes: [:id, :name, :order, :description, :_destroy])
    end
  end
end
