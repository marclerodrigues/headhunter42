module Admin
  class UsersController < ::Admin::BaseController

    def index
      @users = User.admins_and_reviewers.order(id: :desc).page(params[:page])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.skip_password_validation = true
      if @user.save
        @user.invite!
        flash[:notice] = "Usuario criado com sucesso"
        redirect_to admin_dashboards_path
      else
        flash[:alert] = "Teve um erro ao criar o usuario"
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      user_name = @user.first_name
      authorize! :destroy, @user

      @user.destroy
      redirect_to admin_users_path, notice: t('messages.destroyed_with', item: user_name)
    end

    private

    def user_params
      params.require(:user).permit(
        :email, :first_name, :last_name, :role
      )
    end
  end
end
