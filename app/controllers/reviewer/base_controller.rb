module Reviewer
  class BaseController < ApplicationController
    before_action :allowed?

    def allowed?
      #redirect_to root_path unless current_user.reviewer?
    end

  end
end
