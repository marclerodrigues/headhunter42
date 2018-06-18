module Admin
  class UsersController < ::Admin::BaseController
    before_action :set_user, only: :destroy
    load_and_authorize_resource

    def index
      @users = User.admins_and_reviewers.page(params[:page])
    end

    def new
      @user = User.new
    end

    def create
      @user = UserCreator.create(
        first_name: user_params[:first_name],
        last_name: user_params[:last_name],
        email: user_params[:email],
        role: user_params[:role]
      )

      if @user.persisted?
        flash[:notice] = t('messages.user_created')
        redirect_to admin_dashboards_path
      else
        flash[:alert] = t('messages.user_could_not_be_created')
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: t('messages.destroyed_with')
    end

    private

    def user_params
      params.require(:user).permit(
        :email, :first_name, :last_name, :role
      )
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
