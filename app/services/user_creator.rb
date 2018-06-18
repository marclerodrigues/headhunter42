class UserCreator
  attr_accessor :user

  def self.create(user_params)
    @user = User.new(user_params)
    @user.skip_password_validation = true
    if @user.save
      @user.invite!
    end
    @user
  end
end
