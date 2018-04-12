class Ability
  include CanCan::Ability

  def initialize(user)

    can :manage, :all if user.admin?

    can :read, :all if user.reviewer?

  end
end
