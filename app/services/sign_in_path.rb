class SignInPath
  include Rails.application.routes.url_helpers

  def initialize(user)
   @user = user
  end

  def path
    return admin_dashboards_path if user.admin?
    return reviewer_dashboards_path if user.reviewer?
    root_path
  end

 private

 attr_reader :user
end
