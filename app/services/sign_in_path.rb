class SignInPath
  def initialize(user)
   @user = user
  end

  def path
    return 'admin/dashboards#index' if user.admin?
    return 'reviewer/dashboards#index' if user.reviewer?
    return 'admin/dashboards#index' if user.candidate?
  end

 private

 attr_reader :user
end
