module Admin
  class DashboardsController < BaseController
    layout 'admin'

    def index
      render 'index'
    end

  end
end
