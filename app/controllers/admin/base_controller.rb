module Admin
  class BaseController < ApplicationController
    before_action :allowed?

    def allowed?
        redirect_to root_path unless current_user.admin?
    end
  end
end
