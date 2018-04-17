class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(corrent_user)
    user = SignInPath.new(current_user)
    user.path
  end
end
